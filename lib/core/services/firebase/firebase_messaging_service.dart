import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:yemen_offers/core/services/notifications/show_rich_notification.dart';

class FirebaseMessagingService {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final _localNotifications = FlutterLocalNotificationsPlugin();
  static bool _isRequestingPermission = false;

  static Future<void> initializeFCM() async {
    if (_isRequestingPermission) return;
    _isRequestingPermission = true;

    try {
      // التحقق من حالة الإذن أولاً
      NotificationSettings settings =
          await _firebaseMessaging.getNotificationSettings();
      
      if (settings.authorizationStatus == AuthorizationStatus.denied) {
        await _firebaseMessaging.requestPermission();
      }

      // أخذ التوكن
      final fcmToken = await _firebaseMessaging.getToken();
      print('🔑 FCM Token: $fcmToken');

      // إعداد قناة الإشعارات
      const androidChannel = AndroidNotificationChannel(
        'channel_id', // يجب أن يكون نفس ID الموجود في الميتا داتا
        'Default Notifications',
        importance: Importance.max,
      );

      await _localNotifications
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(androidChannel);

      // تهيئة الإشعارات المحلية
      const androidSettings = AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      );
      const initSettings = InitializationSettings(android: androidSettings);
      await _localNotifications.initialize(initSettings);

      // استقبال الإشعارات أثناء عمل التطبيق (Foreground)
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('📨 Foreground message: ${message.notification?.title}');
        if (message.notification != null) {
          showRichNotification(message);
        }
      });

      // عند فتح التطبيق من الإشعار (خلفية أو موقوف)
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('📂 Notification clicked (background or terminated)');
        // يمكنك توجيه المستخدم لصفحة معينة هنا
      });
    } catch (e) {
      print('❌ Error initializing FCM: $e');
    } finally {
      _isRequestingPermission = false;
    }
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
