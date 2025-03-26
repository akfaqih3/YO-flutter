
List<CategoryModel> categoryModelFromJson(List<dynamic> json) =>
    List<CategoryModel>.from(json.map((x) => CategoryModel.fromJson(x)));

///StoreCategory
class CategoryModel {
  String? image;
  String name;
  String slug;

  CategoryModel({this.image, required this.name, required this.slug});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    image: json["image"],
    name: json["name"],
    slug: json["slug"],
  );
}
