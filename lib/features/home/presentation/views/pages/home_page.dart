import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/home_controller.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/app_search_bar_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/carousel/carousel_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/categories/home_category_widget.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final recommendationsOffer = controller.recommendationsOffers;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Obx(() => CarouselWidget(offers: recommendationsOffer.value)),
                Positioned(top: 32, left: 8, right: 8, child: AppSearchBar()),
              ],
            ),
            const SizedBox(height: 16),
            Obx(() {
              return HomeCategoryWidget(
                categories: controller.browseController.categories.value,
              );
            }),
          ],
        ),
      ),
    );
  }
}
