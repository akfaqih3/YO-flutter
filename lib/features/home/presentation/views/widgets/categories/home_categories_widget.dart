import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}
