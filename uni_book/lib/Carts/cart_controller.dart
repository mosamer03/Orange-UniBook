import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uni_book/Carts/CartItemModel.dart';

class ProductModel {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
  });
}

const String API_URL = 'https://your-api-server.com/api/v1/place-order';

class CartController with ChangeNotifier {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get cartItems => [..._items];

  double get totalAmount {
    return _items.fold(0.0, (sum, item) => sum + item.subtotal);
  }

  int get itemCount => _items.length;

  int _findCartItemIndex(String productedId) {
    return _items.indexWhere((item) => item.productId == productedId);
  }

  void addToCart(ProductModel product) {
    final index = _findCartItemIndex(product.id);
    if (index >= 0) {
      _items[index].quantity += 1;
    } else {
      _items.add(
        CartItemModel(
          productId: product.id,
          title: product.title,
          price: product.price,
          quantity: 1,
          imageUrl: product.imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _items.removeWhere((item) => item.productId == productId);
    notifyListeners();
  }

  void updateQuantity(String productId, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(productId);
      return;
    }

    final index = _findCartItemIndex(productId);

    if (index >= 0) {
      _items[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  Future<bool> placeOrder({
    required String deliveryAddress,
    required String contactNumber,
    required String userID,
  }) async {
    if (_items.isEmpty) return false;

    final String generatedOrderID = DateTime.now().millisecondsSinceEpoch.toString();

    final orderData = {
      'user_id': userID,
      'order_id': generatedOrderID,
      'delivery_address': deliveryAddress,
      'contact_number': contactNumber,
      'items': _items.map((item) => item.toMap()).toList(),
      'total_amount': totalAmount,
      'status': 'Pending',
      'order_date': DateTime.now().toIso8601String(),
    };

    try {
      final response = await http.post(
        Uri.parse(API_URL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(orderData),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        if (kDebugMode) print('Order Placed Successfully! Server Response: ${response.body}');
        clearCart();
        return true;
      } else {
        if (kDebugMode) print('Order Failed. Status: ${response.statusCode}, Body: ${response.body}');
        return false;
      }
    } catch (e) {
      if (kDebugMode) print('Network/Unknown Error: $e');
      return false;
    }
  }
}