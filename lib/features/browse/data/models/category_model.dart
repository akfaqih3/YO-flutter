List<CategoryModel> categoriesModelFromJson(List<dynamic> json) =>
    List<CategoryModel>.from(json.map((x) => CategoryModel.fromJson(x)));

///StoreCategory
class CategoryModel {
  String? image;
  String name;
  String nameAr;
  String slug;

  CategoryModel({this.image, required this.name, required this.slug, required this.nameAr});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    image: json["image"],
    name: json["name"],
    nameAr: json["name_ar"],
    slug: json["slug"],
  );

    Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "name_ar": nameAr,
        "slug": slug,
    };
}
