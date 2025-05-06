import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/main_controller.dart';
import 'package:yemen_offers/features/home/presentation/views/pages/home_page.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/footer/fap_bottom_app_bar_item.dart';
import 'package:yemen_offers/features/profile/presentation/pages/user_profile_page.dart';

class AppBottomBarWidget extends StatelessWidget {
  const AppBottomBarWidget({Key? key, required this.selectedPage})
    : super(key: key);

  final RxInt selectedPage;

  @override
  Widget build(BuildContext context) {
    return FABBottomAppBar(
      items: [
        FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
        FABBottomAppBarItem(iconData: Icons.person, text: 'Profile'),
      ],
      centerItemText: '...',
      height: 60,
      iconSize: 24,
      backgroundColor: AppColors.white,
      color: AppColors.grey,
      selectedColor: AppColors.primary,
      notchedShape: CircularNotchedRectangle(),
      onTabSelected: (int index) {
        selectedPage.value = index;
        index == 0
            ? Get.find<MainController>().selected.value = HomePage()
            : Get.find<MainController>().selected.value = UserProfilePage();
      },
    );
  }
}
