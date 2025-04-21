import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/offer_details_controller.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offer_details_widget.dart';

class OfferDetailsPage extends GetView<OfferDetailsController> {
  const OfferDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("عرض العرض"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: OfferDetailsWidget(
                offer: controller.offer.value,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("العودة"),
                ),
                TextButton(
                  onPressed: () {
                  },
                  child: Text("حذف العرض"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}