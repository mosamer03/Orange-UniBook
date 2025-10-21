import 'package:flutter/material.dart';
import 'package:uni_book/constants.dart';
import 'package:uni_book/widgets/custom_text_field.dart';
import 'package:uni_book/screens/selection_verification_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String customLogoPath = 'assets/images/ub white.png';

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            Image.asset(
              customLogoPath,
              height: 50,
            ),
            const SizedBox(height: 20),
            const Text('Sign Up', style: kTitleTextStyle),
            const SizedBox(height: 50),

            CustomTextField(hintText: 'First Name', controller: firstNameController),
            CustomTextField(hintText: 'Last Name', controller: lastNameController),
            CustomTextField(hintText: 'Email', controller: emailController),
            CustomTextField(hintText: 'Phone Number', controller: phoneController),
            CustomTextField(hintText: 'Password', isPassword: true, controller: passwordController),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  MockUser.email = emailController.text;
                  MockUser.phoneNumber = phoneController.text;
                  MockUser.firstName = firstNameController.text;
                  MockUser.lastName = lastNameController.text;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectionVerificationScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Sign Up',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}