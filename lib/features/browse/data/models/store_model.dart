import 'package:yemen_offers/features/browse/data/models/category_model.dart';

List<StoreModel> storesModelFromJson(List<dynamic> json) =>
    List<StoreModel>.from(json.map((x) => StoreModel.fromJson(x)));

///Store
class StoreModel {
  CategoryModel category;
  String? address;
  String? description;
  String? image;
  String? latitude;
  String? longitude;
  String name;
  String? phone;
  String slug;
  SocialMediaModel? socialMedia;
  String? website;
  String? distance;
  String? total;

  StoreModel({
    required this.category,
    this.address,
    this.description,
    this.image,
    this.latitude,
    this.longitude,
    required this.name,
    this.phone,
    required this.slug,
    this.socialMedia,
    this.website,
    this.distance,
    this.total,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
    category: CategoryModel.fromJson(json["category"]),
    address: json["address"],
    description: json["description"],
    image: json["image"],
    latitude: json["latitude"].toString(),
    longitude: json["longitude"].toString(),
    name: json["name"],
    phone: json["phone"],
    slug: json["slug"],
    socialMedia:
        json["social_media"] == null
            ? null
            : SocialMediaModel.fromJson(json["social_media"]),
    website: json["website"],
    distance: json["distance"].toString(),
    total: json["total"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "category": category.slug,
    "address": address,
    "description": description,
    "image": image,
    "latitude": latitude,
    "longitude": longitude,
    "name": name,
    "phone": phone,
    "slug": slug,
    "social_media": socialMedia?.toJson(),
    "website": website,
  };
}

class SocialMediaModel {
  String? facebook;
  String? instagram;
  String? snapchat;

  SocialMediaModel({this.facebook, this.instagram, this.snapchat});

  factory SocialMediaModel.fromJson(Map<String, dynamic> json) =>
      SocialMediaModel(
        facebook: json["facebook"],
        instagram: json["instagram"],
        snapchat: json["snapchat"],
      );

  Map<String, dynamic> toJson() => {
    "facebook": facebook,
    "instagram": instagram,
    "snapchat": snapchat,
  };
}
