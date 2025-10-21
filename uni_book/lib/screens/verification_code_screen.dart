import 'package:flutter/material.dart';
import 'package:uni_book/constants.dart';
import 'package:uni_book/screens/credentials_screen.dart'; // ✅ الانتقال لشاشة تعيين كلمة المرور

class VerificationCodeScreen extends StatelessWidget {
  final String destination;

  const VerificationCodeScreen({Key? key, required this.destination}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 50),

            const VerificationIcon(),
            const SizedBox(height: 30),

            const Text(
              'Verification Code',
              style: kPageHeaderStyle,
            ),
            const SizedBox(height: 15),

            Text(
              'Enter the 4-digit code we\'ve sent to $destination',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 40),

            // حقول إدخال الرمز (OTP Fields)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => const OtpField()),
            ),
            const SizedBox(height: 20),

            // رابط إعادة الإرسال
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't get the code? "),
                GestureDetector(
                  onTap: () {
                    // منطق إعادة إرسال الرمز
                  },
                  child: const Text('Click to resend', style: kSmallLinkStyle),
                ),
              ],
            ),
            const SizedBox(height: 50),

            // أزرار إلغاء والتحقق
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Cancel', style: TextStyle(fontSize: 18, color: Colors.black)),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // الانتقال إلى شاشة تعيين كلمة مرور جديدة
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CredentialsScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryOrange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Verify', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OtpField extends StatelessWidget {
  const OtpField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Center(
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class VerificationIcon extends StatelessWidget {
  const VerificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.mail_outline, size: 100, color: Colors.grey[400]),
          Positioned(
            right: 25,
            bottom: 25,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: kPrimaryOrange,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, size: 30, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}