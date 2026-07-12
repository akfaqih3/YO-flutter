import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/categories/category_image_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.categories,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
  });

  final List<CategoryEntity> categories;
  final Color textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Row(
            children:
                categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.browse,
                        arguments: {"category": category},
                      );
                    },
                    child: CategoryImageWidget(category: category),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
