import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';

class FcmTokenServices {
  static Future<void> sendFCMTokenToServer() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      final ApiService apiService = Get.find<ApiService>();
      await apiService.post(
        Endpoint.fcmToken,
        data: {ApiKeys.fcmToken: fcmToken},
      );
    }
  }

  static Future<void> deleteFCMTokenFromServer() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      final ApiService apiService = Get.find<ApiService>();
      await apiService.delete(
        Endpoint.fcmToken,
        data: {ApiKeys.fcmToken: fcmToken},
      );
    }
    
  }
}
