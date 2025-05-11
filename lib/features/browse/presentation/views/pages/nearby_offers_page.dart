import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/common/presentation/layout/map_layout.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/nearby_offers_controller.dart';

class NearbyOffersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NearbyOffersController>();

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return controller.isOffersleading.value
              ? const Center(child: CircularProgressIndicator())
              : controller.offers.value.isEmpty
              ? const Center(child: Text('لا توجد عروض في المنطقة المحددة'))
              : MapLayout(
                offers: controller.offers.value,
                distanceKm: controller.distanceKM.value,
              );
        }),
      ),
    );
  }
}
