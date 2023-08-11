import 'package:dental_news/Model/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'ThemeMode/AppTheme.dart';
import 'ThemeMode/ThemeProvider.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const AndroidInitializationSettings initializationSettingsandroid =
      AndroidInitializationSettings("@drawable/ic_launcher");

  const DarwinInitializationSettings darwinInitializationSettings =
      DarwinInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsandroid,
    iOS: darwinInitializationSettings,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  // final fcmToken = await FirebaseMessaging.instance.getToken();
  // print(fcmToken);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('th')],
      path: 'assets/lang',
      fallbackLocale: const Locale('th'),
      child: const Dental_News(),
    ),
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class Dental_News extends StatefulWidget {
  const Dental_News({
    super.key,
  });

  @override
  State<Dental_News> createState() => _Dental_NewsState();
}

class _Dental_NewsState extends State<Dental_News> {
  bool isLoggedIn = false;

  void login() {
    setState(() {
      isLoggedIn = true;
    });
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
          home: const IntroPage(),
        ),
      ),
    );
  }
}
