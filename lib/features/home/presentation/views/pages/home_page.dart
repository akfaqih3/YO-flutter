import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/home_controller.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/app_search_bar_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/carousel/carousel_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/categories/home_category_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/sections/home_heading_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/sections/home_latest_offers_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/sections/home_most_popular_offers_section_widget.dart';

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
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                ),
                Obx(() => CarouselWidget(offers: recommendationsOffer.value)),
                Positioned(top: 32, left: 8, right: 8, child: AppSearchBar()),
                Positioned(
                  bottom: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      color: Colors.amberAccent,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 380,
                    child: HomeBodyWidget(controller: controller),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Column(
          children: [
            Obx(() {
              return HomeCategoryWidget(
                categories: controller.browseController.categories.value,
              );
            }),
            HomeHeadingWidget(
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
            HomeHeadingWidget(
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
