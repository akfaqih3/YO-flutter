import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/common/presentation/no_internet_page.dart';
import 'package:yemen_offers/core/common/services/network_service.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/favorite/presentation/getX/controllers/favorite_controller.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/main_controller.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/footer/app_bottom_bar_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/footer/app_bottom_navigation_bar_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/footer/floating_action_bar_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/header/appBar.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/header/favorite_icon_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/header/notification_icon_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/home_header_widget.dart';
import 'package:yemen_offers/features/notification/presentation/getX/controllers/notification_controller.dart';

class MainPage extends GetView<MainController> {
  MainPage({super.key});

  final NetworkService networkService = Get.find<NetworkService>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          !networkService.isConnected.value
              ? const NoInternetPage()
              : Scaffold(
                appBar: CustomAppBar(
                  title: Text(
                    appName.tr,
                    style: TextStyle(color: AppColors.primary),
                  ),
                  actions: [HomeHeaderWidget(controller: controller)],
                ),

                body: Obx(() => controller.selected.value),
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(bottom: 16, right: 16),

                  child: FloatingActionBarWidget(
                    selectedPage: controller.selectedPage,
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.miniCenterDocked,
                // bottomNavigationBar: AppBottomNavigationBarWidget(
                //   selectedPage: controller.selectedPage,
                // ),
                bottomNavigationBar: AppBottomBarWidget(
                  selectedPage: controller.selectedPage,
                ),
              ),
    );
  }
}
