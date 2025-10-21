import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_book/main_app_state.dart';
import 'package:uni_book/Carts/cart_controller.dart';

void main() {
  runApp(
    // ✅ إعداد CartController كمدير للحالة على مستوى التطبيق
    ChangeNotifierProvider(
      create: (context) => CartController(),
      child: const UniBookAppState(), // UniBookAppState هو الجذر الذي يدعم تغيير اللغة
    ),
  );
}