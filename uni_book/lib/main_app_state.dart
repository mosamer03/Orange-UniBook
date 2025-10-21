import 'package:flutter/material.dart';
import 'package:uni_book/constants.dart';
import 'package:uni_book/screens/started_screen.dart';

class UniBookAppState extends StatefulWidget {
  const UniBookAppState({Key? key}) : super(key: key);

  static _UniBookAppStateState of(BuildContext context) =>
      context.findAncestorStateOfType<_UniBookAppStateState>()!;

  @override
  State<UniBookAppState> createState() => _UniBookAppStateState();
}

class _UniBookAppStateState extends State<UniBookAppState> {
  void setLocale(Locale newLocale) {
    setState(() {
      AppLanguage.currentLocale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniBOOK Store',
      theme: ThemeData(
        primaryColor: kPrimaryOrange,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      locale: AppLanguage.currentLocale,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: const StartedScreen(),
    );
  }
}