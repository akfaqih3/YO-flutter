import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_add_store_controller.dart';

class BuildCategoryDropdown extends StatelessWidget {
  const BuildCategoryDropdown({
    super.key,
    required this.controller,
    required this.categories,
  });

  final controller;
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Obx(
        () => DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: lblcategory.tr,
            border: OutlineInputBorder(),
          ),
          value:
              (controller.selectedCategory.value.isEmpty)
                  ? categories.first.slug
                  : controller.selectedCategory.value,
          items:
              categories
                  .map(
                    (e) => DropdownMenuItem(value: e.slug, child: Text(e.name)),
                  )
                  .toList(),
          onChanged: (value) => controller.selectedCategory(value!),
        ),
      ),
    );
  }
}
