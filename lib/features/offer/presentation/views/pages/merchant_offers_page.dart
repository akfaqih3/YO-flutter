import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/offer/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/offer/presentation/views/widgets/offer_list_item_widget.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_store_details_controller.dart';

class MerchantOffersPage extends GetView<MerchantStoreDetailsController> {

  const MerchantOffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = controller.offers;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عرض عنصرين في كل صف
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7, // نسبة العرض إلى الارتفاع
          ),
          itemCount: offers.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: OfferListItemWidget(offer: offers[index]),
              onTap: () {
                  controller.getOfferDetails(offers[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
