import 'package:flutter/material.dart';

// الألوان والأنماط
const Color kPrimaryOrange = Color(0xFFF58025);

const TextStyle kTitleTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const TextStyle kSmallLinkStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: kPrimaryOrange,
);

const TextStyle kPageHeaderStyle = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w900,
  color: Colors.black,
  height: 1.2,
);

// محاكاة قاعدة البيانات وحالة اللغة

class MockUser {
  static String email = 'user@example.com';
  static String phoneNumber = '+962799876543';
  static String firstName = 'محمد';
  static String lastName = 'أحمد';
}

class AppLanguage {
  static Locale currentLocale = const Locale('en', 'US');

  static String translate(String ar, String en) {
    return currentLocale.languageCode == 'ar' ? ar : en;
  }
}