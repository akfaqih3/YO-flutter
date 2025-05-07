import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/common/presentation/widgets/store_list_item_widget.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';

class StoreTabWidget extends StatelessWidget {
  final List<StoreEntity> stores;
  final ScrollController scrollController;
  const StoreTabWidget({
    Key? key,
    required this.stores,
    required this.scrollController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale?.languageCode == 'ar';
    return Scaffold(
      body: ListView.builder(
        controller: scrollController,
        itemCount: stores.length,
        itemBuilder: (context, index) {
          return StoreListItemWidget(
            storeName: stores[index].name,
            storeDescription: stores[index].description ?? "",
            storeCategory: isRTL? stores[index].category.nameAr : stores[index].category.name,
            storeAddress: stores[index].address ?? "",
            imageUrl: stores[index].image ?? "",
          );
        },
      ),
    );
  }
}
