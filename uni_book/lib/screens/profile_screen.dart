import 'package:flutter/material.dart';
import 'package:uni_book/constants.dart';
import 'package:uni_book/screens/settings_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  // ✅ تم تبسيط الباني ليصبح ثابتاً ولا يحتوي على أي منطق تنفيذي
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // تهيئة userName داخل build
    final String userName = MockUser.firstName.isNotEmpty
        ? '${MockUser.firstName} ${MockUser.lastName}'
        : AppLanguage.translate('اسم المستخدم', 'Name of user');

    String profileTitle = AppLanguage.translate('الملف الشخصي', 'Profile');
    String yourOrder = AppLanguage.translate('طلباتك', 'Your order');
    String about = AppLanguage.translate('حول التطبيق', 'About');

    return Scaffold(
      appBar: AppBar(
        title: Text(profileTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // بطاقة اسم المستخدم والإعدادات (تنقل إلى الإعدادات)
            ProfileTile(
              icon: Icons.person_outline,
              title: userName,
              trailingIcon: Icons.settings,
              onTap: () {
                // ✅ التصحيح: إزالة 'const' من MaterialPageRoute لتجنب خطأ التعبير الثابت
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
              },
            ),
            const SizedBox(height: 15),

            // بطاقة الطلبات
            ProfileTile(
              icon: Icons.receipt_long,
              title: yourOrder,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppLanguage.translate('صفحة الطلبات قيد الإنشاء', 'Order Page Coming Soon'))));
              },
            ),
            const SizedBox(height: 15),

            // بطاقة حول التطبيق
            ProfileTile(
              icon: Icons.info_outline,
              title: about,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppLanguage.translate('حول التطبيق قيد الإنشاء', 'About page coming soon'))));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

// الكلاسات المساعدة

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconData? trailingIcon;
  final VoidCallback onTap;

  const ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailingIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: kPrimaryOrange.withOpacity(0.1),
          radius: 25,
          child: Icon(icon, color: kPrimaryOrange),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Icon(trailingIcon ?? Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: const Icon(Icons.home_outlined), label: AppLanguage.translate('الرئيسية', 'Home')),
        BottomNavigationBarItem(icon: const Icon(Icons.shopping_cart_outlined), label: AppLanguage.translate('السلة', 'Cart')),
        BottomNavigationBarItem(icon: const Icon(Icons.person_outline), label: AppLanguage.translate('البروفايل', 'Profile')),
      ],
      currentIndex: 2,
      selectedItemColor: kPrimaryOrange,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: (index) {
        // منطق التنقل للصفحات الأخرى
      },
    );
  }
}