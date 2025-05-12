import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yemen_offers/core/common/presentation/widgets/store_list_item_widget.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/store_list_controller.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/category_list_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/store/store_card_details_widget.dart';

class StoreListPage extends StatelessWidget {
  const StoreListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoreListController());
    final isRTL = Get.locale?.languageCode == 'ar';
    return Scaffold(
      appBar: AppBar(title: Text(lblStores.tr)),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Obx(() {
              return controller.categories.isNotEmpty
                  ? CategoryListWidget(controller: controller)
                  : Text(lblNoInternet.tr);
            }),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Obx(() {
                if (controller.stores.isEmpty) {
                  return Center(child: Text(lblNoStores.tr));
                }
                final stores = controller.stores;
                return ListView.builder(
                  itemCount: stores.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.storeDetails,
                          arguments: {ApiKeys.store: stores[index]},
                        );
                      },
                      child: StoreListItemWidget(
                        storeName: stores[index].name,
                        storeDescription: stores[index].description ?? "",
                        storeCategory:
                            isRTL
                                ? stores[index].category.nameAr
                                : stores[index].category.name,
                        storeAddress: stores[index].address ?? "",
                        imageUrl: stores[index].image ?? "",
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class StoreCategoryItemWidget extends StatelessWidget {
  final String categoryName;
  final String categorySlug;

  StoreCategoryItemWidget({
    required this.categoryName,
    required this.categorySlug,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.network(
            "",
            width: 64,
            height: 72,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported),
          ),
        ), // RTL: back icon to the left
        title: Text(
          categoryName,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${lblcategory.tr}: $categoryName",
              style: const TextStyle(color: AppColors.grey),
              textAlign: TextAlign.right,
              maxLines: 1,
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.grey),
      ),
    );
  }
}
