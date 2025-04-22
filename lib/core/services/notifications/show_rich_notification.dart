import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/services/firebase/firebase_messaging_background_handler.dart';

Future<String> _downloadAndSaveFile(String url, String fileName) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final String filePath = '${directory.path}/$fileName';
  final http.Response response = await http.get(Uri.parse(url));
  final File file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);
  return filePath;
}

Future<void> showRichNotification(RemoteMessage message) async {
  final String imageUrl =
      message.notification?.android?.imageUrl ?? message.data['image'] ?? '';

  String? largeIconPath;
  String? bigPicturePath;

  if (imageUrl.isNotEmpty) {
    final String url = '${ApiConst.domain}${imageUrl}';
    largeIconPath = await _downloadAndSaveFile(url, 'largeIcon');
    bigPicturePath = await _downloadAndSaveFile(url, 'bigPicture');
  }

  final BigPictureStyleInformation bigPictureStyleInformation =
      BigPictureStyleInformation(
        FilePathAndroidBitmap(bigPicturePath ?? ''),
        largeIcon: FilePathAndroidBitmap(largeIconPath ?? ''),
        contentTitle: message.notification?.title,
        summaryText: message.notification?.body,
        htmlFormatContent: true,
        htmlFormatContentTitle: true,
      );

  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'offers_channel',
        'إشعارات العروض',
        channelDescription: 'إشعارات تحتوي على صور للعروض',
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: bigPictureStyleInformation,
      );

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    message.notification?.title ?? '',
    message.notification?.body ?? '',
    platformChannelSpecifics,
  );
}
