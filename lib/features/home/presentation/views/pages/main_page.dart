import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/main_controller.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/footer/app_bottom_bar_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/footer/app_bottom_navigation_bar_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/footer/floating_action_bar_widget.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Yeme Offers")),
      body: Obx(() => controller.selected.value),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 16),

        child: FloatingActionBarWidget(selectedPage: controller.selectedPage),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      // bottomNavigationBar: AppBottomNavigationBarWidget(
      //   selectedPage: controller.selectedPage,
      // ),
      bottomNavigationBar: AppBottomBarWidget(
        selectedPage: controller.selectedPage,
      ),
    );
  }
}
