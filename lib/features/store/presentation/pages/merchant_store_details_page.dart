import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/offer/presentation/views/pages/merchant_offers_page.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_store_details_controller.dart';
import 'package:yemen_offers/features/store/presentation/widgets/store_details_card_widget.dart';

class MerchantStoreDetailsPage extends GetView<MerchantStoreDetailsController> {
  const MerchantStoreDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("المتجر")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            StoreDetailsCardWidget(store: controller.store.value!),
            const SizedBox(height: 16),
            MerchantOffersPage(),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.goToAddOffer();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
