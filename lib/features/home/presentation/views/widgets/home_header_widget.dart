import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/favorite/presentation/getX/controllers/favorite_controller.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/home_controller.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/header/app_search_bar_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/header/favorite_icon_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/header/notification_icon_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  HomeHeaderWidget({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: AppSearchBarWidget()),
          NotificationIconWidget(notificationCount: 3),
          Obx(
            () => FavoriteIconWidget(
              favorites: controller.favoriteController.favorites.value,
            ),
          ),
        ],
      ),
    );
  }
}
