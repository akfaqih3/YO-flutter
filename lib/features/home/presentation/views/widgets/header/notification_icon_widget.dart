import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';

class NotificationIconWidget extends StatelessWidget {
  final int notificationCount;

  const NotificationIconWidget({super.key, required this.notificationCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.notifications, size: 36, color: Colors.white),
          onPressed: () {
            Get.toNamed(AppRoutes.notifications);
          },
        ),
        if (notificationCount > 0) // إظهار العدد فقط إذا كان هناك إشعارات
          Positioned(
            right: 5,
            top: 5,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(minWidth: 20, minHeight: 20),
              child: Text(
                notificationCount.toString(),
                style: TextStyle(
                  color: Colors.white,
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
