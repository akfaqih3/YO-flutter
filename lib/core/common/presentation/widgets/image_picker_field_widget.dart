import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart'; // إذا كنت تستخدم GetX

class ImagePickerFieldWidget extends StatelessWidget {
  const ImagePickerFieldWidget({
    super.key,
    required this.onTap,
    required this.imagePath,
    this.labelText = 'Select Image',
    this.icon = Icons.add_photo_alternate_outlined,
    this.emptyMessage = 'Tap to upload',
    this.borderRadius = 8,
    this.borderWidth = 1,
    this.borderColor = Colors.grey,
    this.backgroundColor = Colors.grey,
    this.imageHeight = 100,
    this.outerBorderColor = Colors.grey, // لون الإطار الخارجي
    this.outerBorderWidth = 0.8, // سمك الإطار الخارجي
    this.outerBorderRadius = 12.0,
    this.width = double.infinity,
  });

  final VoidCallback onTap;
  final Rx<File?> imagePath; // استخدم Rx<File?> إذا كنت تستخدم GetX للمراقبة
  final String labelText;
  final IconData icon;
  final String emptyMessage;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Color backgroundColor;
  final double imageHeight;
  final Color outerBorderColor;
  final double outerBorderWidth;
  final double outerBorderRadius;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(outerBorderRadius)),
          border: Border.all(
            style: BorderStyle.solid, // استخدام نمط متقطع
            width: outerBorderWidth,
            color: outerBorderColor,
          ),
        ),
        padding: const EdgeInsets.all(4), // إضافة تباعد داخلي للحاوية الخارجية
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              labelText.tr,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                height: imageHeight,
                decoration: BoxDecoration(
                  color: backgroundColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(
                    color: borderColor.withOpacity(0.6),
                    style: BorderStyle.solid,
                    width: borderWidth,
                  ),
                ),
                child: Obx(
                  () =>
                      imagePath.value != null
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(borderRadius),
                            child: Image.file(
                              imagePath.value!,
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          )
                          : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  icon,
                                  size: 36,
                                  color: borderColor.withOpacity(0.7),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  emptyMessage.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: borderColor.withOpacity(0.7),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
