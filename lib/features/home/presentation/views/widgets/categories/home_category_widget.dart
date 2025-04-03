
import 'package:flutter/widgets.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/categories/category_image_widget.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({super.key, required this.categories});
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    

    return SizedBox(
      height: 200,
      width: 400,
      child: CategoryImageWidget(
        categories: categories, 
      ),
    );
  }
}
