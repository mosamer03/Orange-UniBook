import 'package:flutter/material.dart';
import 'package:uni_book/constants.dart';
import 'package:uni_book/screens/verification_code_screen.dart';

class SelectionVerificationScreen extends StatelessWidget {
  const SelectionVerificationScreen({Key? key}) : super(key: key);

  String formatPhoneNumber(String phone) {
    if (phone.length < 9) return phone;
    String prefix = phone.substring(0, 5);
    String suffix = phone.substring(phone.length - 2);
    return '$prefix******$suffix';
  }

  String formatEmail(String email) {
    if (!email.contains('@')) return email;
    final parts = email.split('@');
    String user = parts[0];
    String domain = parts[1];

    if (user.length > 3) {
      user = user.substring(0, 3) + '***';
    } else {
      user = '***';
    }
    return '$user@$domain';
  }

  @override
  Widget build(BuildContext context) {
    final String displayedPhone = formatPhoneNumber(MockUser.phoneNumber.isNotEmpty ? MockUser.phoneNumber : '+962799876543');
    final String displayedEmail = formatEmail(MockUser.email.isNotEmpty ? MockUser.email : 'example@gmail.com');

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MAKE\nSELECTION',
              style: kPageHeaderStyle,
            ),
            const SizedBox(height: 10),
            const Text(
              'Which way would you like to receive the account verification code ?',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 50),

            // خيار الرسالة النصية (SMS)
            _SelectionTile(
              icon: Icons.phone_outlined,
              title: 'Via SMS:',
              subtitle: displayedPhone,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerificationCodeScreen(destination: displayedPhone)),
                );
              },
            ),
            const SizedBox(height: 20),

            // خيار البريد الإلكتروني (Email)
            _SelectionTile(
              icon: Icons.mail_outline,
              title: 'Via Email:',
              subtitle: displayedEmail,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerificationCodeScreen(destination: displayedEmail)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SelectionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: kPrimaryOrange),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, color: Colors.black54)),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}