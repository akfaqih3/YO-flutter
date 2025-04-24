import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/home_controller.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/categories/home_categories_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/sections/home_section_heading_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/sections/home_latest_offers_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/sections/home_most_popular_offers_section_widget.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: AppColors.background,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 380,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              return HomeCategoriesWidget(
                categories: controller.categoriesController.categories.value,
              );
            }),
            HomeSectionHeadingWidget(
              title: 'Most Popular Offers',
              showActionButton: true,
              onPressed: () {},
              textColor: Colors.black,
            ),
            Obx(() {
              return HomeMostPopularOffersSectionWidget(
                offers: controller.mostPopularOffers.value,
              );
            }),
            const SizedBox(height: 8),
            HomeSectionHeadingWidget(
              title: 'Latest Offers',
              showActionButton: true,
              onPressed: () {},
              textColor: Colors.black,
            ),
            Obx(() {
              return HomeLatestOffersWidget(
                offers: controller.latestOffers.value,
              );
            }),
          ],
        ),
      ),
    );
  }
}
