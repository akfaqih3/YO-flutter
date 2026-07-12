import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/offer/presentation/getX/controllers/merchant_add_update_offer_controller.dart';

class BuildOfferCategoriesDropdown extends StatelessWidget {
  const BuildOfferCategoriesDropdown({super.key, required this.controller});

  final MerchantAddUpdateOfferController controller;

  @override
  Widget build(BuildContext context) {
    final List<OfferCategoryEntity> categories =
        controller.offerCategories.value;
    return categories.isEmpty
        ? Container()
        : DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: lblcategory.tr,
            border: OutlineInputBorder(),
          ),
          value:
              (controller.selectedOfferCategory.value.isEmpty)
                  ? categories.first.slug
                  : controller.selectedOfferCategory.value,
          items:
              categories
                  .map(
                    (e) => DropdownMenuItem(value: e.slug, child: Text(e.name)),
                  )
                  .toList(),
          onChanged: (value) => controller.selectedOfferCategory(value),
        );
  }
}
