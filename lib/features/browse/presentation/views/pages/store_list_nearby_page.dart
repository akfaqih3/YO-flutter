import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/common/presentation/layout/map_layout.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/store_list_nearby_controller.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/store/store_list_nearby_map_widget.dart';

class StoreListNearbyPage extends GetView<StoreListNearbyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return controller.isStoresleading.value
              ? const Center(child: CircularProgressIndicator())
              : controller.stores.value.isEmpty
              ? const Center(child: Text('لا توجد متجر في المنطقة المحددة'))
              : StoreListNearbyMapWidget(controller: controller);
        }),
      ),
    );
  }
}
