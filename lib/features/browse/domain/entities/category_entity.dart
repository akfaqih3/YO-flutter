import 'package:yemen_offers/features/browse/data/models/category_model.dart';

List<CategoryEntity> categoryEntityFromModel(List<CategoryModel> categories) {
  return categories
      .map((category) => CategoryEntity.fromModel(category))
      .toList();
}

class CategoryEntity {
  final String name;
  final String slug;
  final String? image;

  const CategoryEntity({required this.name, required this.slug, this.image});

  factory CategoryEntity.fromModel(CategoryModel categoryModel) {
    return CategoryEntity(
      name: categoryModel.name,
      slug: categoryModel.slug,
      image: categoryModel.image,
    );
  }
}
