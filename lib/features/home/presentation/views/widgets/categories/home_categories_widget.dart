import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/pages/categories_page.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/main_controller.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/categories/category_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/categories/discover_category_widget.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({super.key, required this.categories});
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: Row(
            children: [
              DiscoverCategoryWidget(),
              CategoryWidget(categories: categories),
              // arrow clickable when pressed nav you to show all categories
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Get.find<MainController>().selected.value=CategoriesPage();
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
