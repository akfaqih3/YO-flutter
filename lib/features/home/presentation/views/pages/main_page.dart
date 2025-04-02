import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/main_controller.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/app_bottom_navigation_bar_widget.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Yeme Offers")),
      bottomNavigationBar: AppBottomNavigationBarWidget(
        selectedPage: controller.selectedPage,
      ),
      body: Obx(() => controller.pages[controller.selectedPage.value]),
    );
  }
}
