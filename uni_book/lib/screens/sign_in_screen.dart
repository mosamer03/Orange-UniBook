import 'package:flutter/material.dart';
import 'package:uni_book/screens/sign_up_screen.dart';
import 'package:uni_book/screens/forget_password_screen.dart';
import 'package:uni_book/screens/profile_screen.dart'; // ✅ الكلاس الهدف
import 'package:uni_book/constants.dart';
import 'package:uni_book/widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  final String customLogoPath = 'assets/images/ub white.png';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
        child: Column(
          children: [
            Image.asset(
              customLogoPath,
              height: 50,
            ),

            const SizedBox(height: 20),
            const Text('Sign In', style: kTitleTextStyle),
            const SizedBox(height: 50),

            const CustomTextField(hintText: 'Email or Phone number'),
            const CustomTextField(hintText: 'Password', isPassword: true),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()),
                  );
                },
                child: const Text(
                  'Forget Password ?',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // زر تسجيل الدخول
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // ✅ الكود المصحح: إزالة 'const' من ProfileScreen عند الاستدعاء
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileScreen()),
                        (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Sign In',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            const SizedBox(height: 30),

            Row(
              children: [
                const Expanded(child: Divider(color: Colors.grey)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Or Continue With',
                      style: TextStyle(color: Colors.grey[600])),
                ),
                const Expanded(child: Divider(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialIcon(icon: Icons.apple, onTap: () {}),
                const SizedBox(width: 20),
                _SocialIcon(icon: Icons.g_mobiledata, onTap: () {}),
                const SizedBox(width: 20),
                _SocialIcon(icon: Icons.facebook, onTap: () {}),
              ],
            ),
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: const Text('Sign Up', style: kSmallLinkStyle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 28, color: Colors.black),
      ),
    );
  }
}