

List<FavoriteModel> favoriteModelFromJson(dynamic json) => List<FavoriteModel>.from(json.map((x) => FavoriteModel.fromJson(x)));

class FavoriteModel {
    String category;
    String description;
    String discountPercentage;
    String endDate;
    int id;
    String image;
    String priceAfter;
    String priceBefore;
    String slug;
    String startDate;
    String title;

    FavoriteModel({
        required this.category,
        required this.description,
        required this.discountPercentage,
        required this.endDate,
        required this.id,
        required this.image,
        required this.priceAfter,
        required this.priceBefore,
        required this.slug,
        required this.startDate,
        required this.title,
    });

    factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        category: json["category"],
        description: json["description"],
        discountPercentage: json["discount_percentage"],
        endDate: json["end_date"],
        id: json["id"],
        image: json["image"],
        priceAfter: json["price_after"],
        priceBefore: json["price_before"],
        slug: json["slug"],
        startDate: json["start_date"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "description": description,
        "discount_percentage": discountPercentage,
        "end_date": endDate,
        "id": id,
        "image": image,
        "price_after": priceAfter,
        "price_before": priceBefore,
        "slug": slug,
        "start_date": startDate,
        "title": title,
    };
}