import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:yemen_offers/features/home/presentation/views/pages/home_page.dart';
import 'package:yemen_offers/features/profile/presentation/getX/controllers/user_profile_controller.dart';
import 'package:yemen_offers/features/profile/presentation/pages/user_profile_page.dart';
import 'package:yemen_offers/features/store/presentation/pages/merchant_stores_page.dart';

class MainController extends GetxController {
  final selectedPage = 0.obs;
  final List<Widget> pages = [
    HomePage(),
    MerchantStoresPage(),
    UserProfilePage(),
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
