import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:yemen_offers/features/favorite/presentation/getX/controllers/favorite_controller.dart';
import 'package:yemen_offers/features/favorite/presentation/views/pages/favorite_page.dart';
import 'package:yemen_offers/features/home/presentation/views/pages/home_page.dart';
import 'package:yemen_offers/features/notification/presentation/getX/controllers/notification_controller.dart';
import 'package:yemen_offers/features/profile/presentation/pages/user_profile_page.dart';

class MainController extends GetxController {
  final selectedPage = 0.obs;
  final Rx<Widget> selected = Rx(HomePage());
  final List<Widget> pages = [HomePage(), FavoritePage(), UserProfilePage()];
  final FavoriteController favoriteController = Get.find<FavoriteController>();
  final NotificationController notificationController =
      Get.find<NotificationController>();

  @override
  void onInit() {
    super.onInit();
  }
}
