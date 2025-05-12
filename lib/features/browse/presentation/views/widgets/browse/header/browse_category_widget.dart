import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';

class BrowseCategoryWidget extends StatelessWidget {
  const BrowseCategoryWidget({
    super.key,
    required this.category,
    required this.onTap,
    required this.isSelected,
  });

  final CategoryEntity category;
  final GestureTapCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale?.languageCode == 'ar';
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 90,
        width: 150,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          constraints: const BoxConstraints(minWidth: 80),
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(isSelected ? 500 : 0),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.secondary.withAlpha(100)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              onTap();
            },
            splashColor: AppColors.primary.withAlpha(100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (category.image != null)
                  SizedBox(
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        category.image!,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => const Icon(Icons.image_not_supported),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 20,
                  child: Text(
                    isRTL ? category.nameAr : category.name,
                    style: TextStyle(
                      color: isSelected? AppColors.white: AppColors.textPrimary.withAlpha(200),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 