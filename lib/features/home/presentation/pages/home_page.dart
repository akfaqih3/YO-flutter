import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/login_controller.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الرئيسية")),
      bottomNavigationBar: AppBottomNavigationBarWidget(),
      body: Column(
        children: [
          Text("الرئيسية"),
          ElevatedButton(
            onPressed: () {
              LoginController.logout();
            },
            child: Text("تسجيل الخروج"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.userProfile);
            },
            child: Text("الملف الشخصي"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.merchantStores);
            },
            child: Text("المتاجر"),
          ),
        ],
      ),
    );
  }
}
