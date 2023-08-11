// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class FirestoreService {
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   final CollectionReference _collectionReference =
//       FirebaseFirestore.instance.collection('your_collection_path');

//   Future<void> initializeFirebase() async {
//     await Firebase.initializeApp();
//     _initializeNotifications();
//   }

//   void _initializeNotifications() {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//     );
//     _flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//     );
//   }

//   Future<void> addDocument() async {
//     await _collectionReference.add({'field': 'value'});

//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const NotificationDetails platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//     );

//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       'New Document',
//       'A new document has been added',
//       platformChannelSpecifics,
//     );
//   }
// }
