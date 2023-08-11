// import 'dart:async';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class FirebaseMessagingService {
//   FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   Future<String> getToken() async {
//     String? token = await _firebaseMessaging.getToken();
//     return token!;
//   }

//   void configureMessaging() {
//     _firebaseMessaging.requestPermission();
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("Got a message!");
//       // ดำเนินการแสดงการแจ้งเตือนที่นี่
//     });
//   }
// }
