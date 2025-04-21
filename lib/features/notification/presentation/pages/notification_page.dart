import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/notification/presentation/getX/controllers/notification_controller.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الإشعارات")),
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.notifications.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.notifications[index].title!),
                      subtitle: Text(controller.notifications[index].body!),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
