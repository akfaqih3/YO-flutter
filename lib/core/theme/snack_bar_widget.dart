import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.black.withOpacity(0.8),
    colorText: Colors.white,
    borderRadius: 10,
    margin: EdgeInsets.all(16),
    duration: Duration(seconds: 3),
    icon: Icon(Icons.info, color: Colors.white),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
