import 'package:get/get.dart';
import 'package:yemen_offers/features/notification/presentation/getX/controllers/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(
      () => NotificationController(),
    );
  }
}