import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:yemen_offers/features/favorite/presentation/views/pages/favorite_page.dart';
import 'package:yemen_offers/features/home/presentation/views/pages/home_page.dart';
import 'package:yemen_offers/features/profile/presentation/pages/user_profile_page.dart';

class MainController extends GetxController {
  final selectedPage = 0.obs;
  final List<Widget> pages = [
    HomePage(),
    FavoritePage(),
    UserProfilePage(),
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
