import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';

class CategoryImageWidget extends StatelessWidget {
  const CategoryImageWidget({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale?.languageCode == 'ar';
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        width: 88,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.white,width: 0.4),
          image: DecorationImage(
            image: NetworkImage(category.image!),
            fit: BoxFit.cover,
            
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withAlpha(300),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Container(
          alignment: Alignment.bottomCenter,

          height: MediaQuery.of(context).size.height,
          child: Text(
            isRTL? category.nameAr : category.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,

              fontStyle: FontStyle.italic,
            ),

            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
