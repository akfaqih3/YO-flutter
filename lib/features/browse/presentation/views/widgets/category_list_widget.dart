import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/categories_controller.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/header/browse_category_widget.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key, required this.controller});

  final controller;

  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale?.languageCode == 'ar';
    return Obx(() {
      final List<CategoryEntity> categories = controller.categories.value;
      return categories.isEmpty
          ? const SizedBox()
          : SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final CategoryEntity category = categories[index];
                return Obx(() {
                  final List<String> selectedCategories =
                      controller.selectedCategories.value;
                  return BrowseCategoryWidget(
                    category: category,
                    onTap: () {
                      controller.selectCategory(category);
                    },
                    isSelected: selectedCategories.contains(category.slug),
                  );
                });
              },
            ),
          );
    });
  }
}
