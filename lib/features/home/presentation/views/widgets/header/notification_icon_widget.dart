import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/theme/colors.dart';

class NotificationIconWidget extends StatelessWidget {
  final int notificationCount;

  const NotificationIconWidget({super.key, required this.notificationCount});

  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale?.languageCode == 'ar';
    return Stack(
      children: [
        IconButton(
          icon: Icon(Iconsax.notification5, size: 36, color: AppColors.grey, ),
          onPressed: () {
            Get.toNamed(AppRoutes.notifications);
          },
        ),
        if (notificationCount > 0) // إظهار العدد فقط إذا كان هناك إشعارات
          Positioned(
            right: isRTL ? 5 : null,
            left: isRTL ? null : 5,
            top: 5,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(minWidth: 20, minHeight: 20),
              child: Text(
                notificationCount.toString(),
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
