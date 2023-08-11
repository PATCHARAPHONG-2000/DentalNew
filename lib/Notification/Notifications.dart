import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMessagingService {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> initialize() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // ดำเนินการเมื่อมีการรับข้อความแจ้งเตือนที่เป็น payload มา
      // ตัวอย่างเช่นแสดงแจ้งเตือนในแอปพลิเคชัน
      print("Received notification: ${message.notification?.title}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // ดำเนินการเมื่อผู้ใช้คลิกที่แจ้งเตือนและเปิดแอปพลิเคชัน
      // ตัวอย่างเช่นเปิดหน้าที่เกี่ยวข้องในแอปพลิเคชัน
      print("Notification clicked!");
    });

    String? token = await _firebaseMessaging.getToken();
    print("Firebase token: $token");

    _subscribeToFirestore();
  }

  void _subscribeToFirestore() {
    _firestore.collection('notifications').snapshots().listen((snapshot) {
      // ดำเนินการเมื่อมีการเปลี่ยนแปลงในคอลเลกชัน 'notifications' ใน Cloud Firestore
      for (var docChange in snapshot.docChanges) {
        if (docChange.type == DocumentChangeType.added) {
          // ข้อมูลที่เพิ่มใหม่
          var notificationData = docChange.doc.data();
          // ส่งการแจ้งเตือนไปยังอุปกรณ์ผู้ใช้
          _sendNotificationToDevices(notificationData!);
        }
      }
    });
  }

  void _sendNotificationToDevices(Map<String, dynamic> notificationData) {
    // ส่งการแจ้งเตือนไปยังอุปกรณ์ผู้ใช้โดยใช้ FCM
    // ใช้ข้อมูลใน notificationData ตามความต้องการของคุณในการสร้างแจ้งเตือน
    // ...
  }
}
