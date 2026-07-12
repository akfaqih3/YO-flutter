import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/offers_list_vertical_widget.dart';
import 'package:yemen_offers/features/favorite/presentation/getX/controllers/favorite_controller.dart';

class FavoritePage extends GetView<FavoriteController> {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 16),
          alignment: Alignment.center,
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final _favorites = controller.favorites.value;
              final offers = _favorites.map((e) => e.offer).toList();
              return OffersListVerticalWidget(offers: offers, spacing: 16);
            }
          }),
        ),
      ),
    );
  }
}
