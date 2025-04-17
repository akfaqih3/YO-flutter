import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:yemen_offers/core/services/notifications/show_rich_notification.dart';

class FirebaseMessagingService {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final _localNotifications = FlutterLocalNotificationsPlugin();

  static Future<void> initializeFCM() async {
    // طلب صلاحية الإشعارات (iOS)
    await _firebaseMessaging.requestPermission();

    // أخذ التوكن (يمكنك طباعته)
    final fcmToken = await _firebaseMessaging.getToken();
    print('🔑 FCM Token: $fcmToken');

    // إعداد الإشعارات المحلية لعرضها أثناء التشغيل
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const initSettings = InitializationSettings(android: androidSettings);
    await _localNotifications.initialize(initSettings);

    // Foreground: عند استقبال الإشعار والتطبيق مفتوح
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('📨 Foreground message: ${message.notification?.title}');

      if (message.notification != null) {
        // _showLocalNotification(message);
        showRichNotification(message);
      }
    });

    // Background / Terminated: عند فتح التطبيق من إشعار
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('📂 Notification clicked (background or terminated)');
      // يمكنك توجيه المستخدم لصفحة معينة حسب نوع الرسالة
    });
  }

  static Future<void> _showLocalNotification(RemoteMessage message) async {
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const notificationDetails = NotificationDetails(android: androidDetails);

    await _localNotifications.show(
      message.notification.hashCode,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
  }
}
