import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class MapUtil {
  static void openMap(double latitude, double longitude) async {
    final Uri googleMapsUri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
    );

    if (await canLaunchUrl(googleMapsUri)) {
      await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'لا يمكن فتح تطبيق الخرائط';
    }
  }

  static Future<void> selectLocation({
    required TextEditingController addressController,
    required Rx<double> latitude,
    required Rx<double> longitude,
  }) async {
    try {
      // التحقق من صلاحيات الموقع
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          Get.snackbar(
            "خطأ",
            "يرجى منح إذن الوصول إلى الموقع لاستخدام هذه الميزة.",
          );
          return;
        }
      }

      // الحصول على الموقع الحالي
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // فتح تطبيق الخرائط عند الموقع المحدد
      String googleMapsUrl =
          "https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}";
      await launchUrl(Uri.parse(googleMapsUrl));

      // تحديث الحقول بالموقع الجديد
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      addressController.text =
          "الموقع المحدد (${position.latitude}, ${position.longitude})";
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء تحديد الموقع: $e");
    }
  }
}
