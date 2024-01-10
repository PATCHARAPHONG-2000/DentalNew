// // ignore_for_file: camel_case_types

// import 'package:dental_news/Main_Bottom.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'ThemeMode/AppTheme.dart';
// import 'ThemeMode/ThemeProvider.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp();
//   await EasyLocalization.ensureInitialized();

//   runApp(
//     EasyLocalization(
//       supportedLocales: const [Locale('en'), Locale('th')],
//       path: 'assets/lang',
//       fallbackLocale: const Locale('th'),
//       child: const Dental_News(),
//     ),
//   );
// }

// class Dental_News extends StatefulWidget {
//   const Dental_News({super.key});

//   @override
//   State<Dental_News> createState() => _Dental_NewsState();
// }

// class _Dental_NewsState extends State<Dental_News> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => ThemeProvider(),
//       child: Consumer<ThemeProvider>(
//         builder: (context, themeProvider, child) => MaterialApp(
//           localizationsDelegates: context.localizationDelegates,
//           supportedLocales: context.supportedLocales,
//           locale: context.locale,
//           theme: themeProvider.isDarkTheme ? themeDataLight : themeDataDark,
//           debugShowCheckedModeBanner: false,
//           home: const Home(),
//         ),
//       ),
//     );
//   }
// }

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dental_news/Main_Bottom.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ThemeMode/AppTheme.dart';
import 'ThemeMode/ThemeProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String initialLanguage = prefs.getString('language') ??
      'th'; // ตั้งค่าเริ่มต้นเป็น "th" ถ้าไม่มีค่า
  Locale initialLocale = Locale(initialLanguage); // แปลงค่าเริ่มต้นเป็น Localea

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('th')],
      path: 'assets/lang',
      fallbackLocale: const Locale('th'),
      startLocale: initialLocale, // ใช้ initialLocale ที่แปลงมาเป็น Locale
      child: const Dental_News(),
    ),
  );
}

class Dental_News extends StatefulWidget {
  const Dental_News({super.key});

  @override
  State<Dental_News> createState() => _Dental_NewsState();
}

class _Dental_NewsState extends State<Dental_News> {
  bool _languageSwitchValue = false; // ค่าภาษาเริ่มต้น

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('language');
    final savedTheme = prefs.getBool('isDarkTheme');

    if (savedLanguage != null) {
      context.setLocale(Locale(savedLanguage));
    }

    if (savedTheme != null) {
      context.read<ThemeProvider>().setDarkTheme(savedTheme);
    }
  }

  void changeLanguage(bool value) async {
    if (_languageSwitchValue != value) {
      setState(() {
        _languageSwitchValue = value;
      });

      final languageCode = value ? 'th' : 'en';
      context.setLocale(Locale(languageCode));

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', languageCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: themeProvider.isDarkTheme ? themeDataLight : themeDataDark,
          debugShowCheckedModeBanner: false,
          home: const Home(),
        ),
      ),
    );
  }
}
