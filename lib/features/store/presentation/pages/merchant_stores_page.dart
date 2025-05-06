import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_stores_controller.dart';
import 'package:yemen_offers/features/store/presentation/widgets/merchant_store_list_item_widget.dart';
import 'package:yemen_offers/features/store/presentation/widgets/store_item.dart';

class MerchantStoresPage extends GetView<MerchantStoresController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lblStores.tr)),
      body: Obx(() {
        if (controller.stores.isEmpty) {
          return Center(child: Text(lblNoStores.tr));
        }
        final stores = controller.stores;
        return ListView.builder(
          itemCount: stores.length,
          itemBuilder: (context, index) {
            return MerchantStoreListItemWidget(
              store: stores[index],
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.merchantAddStore);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
