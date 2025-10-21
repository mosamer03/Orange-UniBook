import 'package:flutter/material.dart';
import 'package:uni_book/constants.dart';
import 'package:uni_book/screens/password_updated_screen.dart'; // الانتقال لشاشة التأكيد

class CredentialsScreen extends StatelessWidget {
  const CredentialsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 50),
            // أيقونة الفأرة والنقر (Mock Icon)
            Container(
              width: 100, height: 100,
              child: const Icon(Icons.mouse_outlined, size: 80, color: Colors.black),
            ),
            const SizedBox(height: 30),

            const Text(
              'NEW\nCREDENTIALS',
              textAlign: TextAlign.center,
              style: kPageHeaderStyle,
            ),
            const SizedBox(height: 15),

            const Text(
              "Your Identity has been verified !\nSet your new password",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 40),

            // حقل كلمة المرور الجديدة
            _PasswordInputField(hint: 'New Password'),
            _PasswordInputField(hint: 'Confirm Password'),

            const SizedBox(height: 50),

            // زر UPDATE
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // منطق تحديث كلمة المرور
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PasswordUpdatedScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('UPDATE',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PasswordInputField extends StatelessWidget {
  final String hint;
  const _PasswordInputField({required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
          suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }
}