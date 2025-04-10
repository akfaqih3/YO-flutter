import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/search/presentation/getX/controllers/search_controller.dart';
import 'package:yemen_offers/features/search/presentation/views/widgets/search_bar_widget.dart';
import 'package:yemen_offers/features/search/presentation/views/widgets/search_offers_widget.dart';

class SearchPage extends GetView<SearchOffersController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Column(
        children: [
          // search bar
          const SizedBox(height: 10),
          Obx(() => SearchBarWidget(controller: controller)),
          const SizedBox(height: 10),
          Obx(() => SearchOffersWidget(offers: controller.offers.value)),
        ],
      ),
    );
  }
}
