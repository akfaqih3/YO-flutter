import 'dart:convert';

List<StoreModel> storeModelFromJson(List<dynamic> json) =>
    List<StoreModel>.from(json.map((x) => StoreModel.fromJson(x)));

String storeModelToJson(List<StoreModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreModel {
  String? address;
  String category;
  String? description;
  int? id;
  String? image;
  bool? isActive;
  String? latitude;
  String? longitude;
  String name;
  String phone;
  String? slug;
  SocialMedia? socialMedia;
  String? website;

  StoreModel({
    this.address,
    required this.category,
    this.description,
    this.id,
    required this.image,
    this.isActive,
    this.latitude,
    this.longitude,
    required this.name,
    required this.phone,
    this.slug,
    this.socialMedia,
    this.website,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
    address: json["address"],
    category: json["category"],
    description: json["description"],
    id: json["id"],
    image: json["image"],
    isActive: json["is_active"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    name: json["name"],
    phone: json["phone"],
    slug: json["slug"],
    socialMedia: SocialMedia.fromJson(json["social_media"]),
    website: json["website"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "category": category,
    "description": description,
    "id": id,
    "image": image,
    "is_active": isActive,
    "latitude": latitude,
    "longitude": longitude,
    "name": name,
    "phone": phone,
    "slug": slug,
    "social_media": socialMedia?.toJson(),
    "website": website,
  };
}

class SocialMedia {
  String? facebook;
  String? instagram;
  String? twitter;
  String? youtube;

  SocialMedia({
     this.facebook,
     this.instagram,
     this.twitter,
     this.youtube,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
    facebook: json["facebook"],
    instagram: json["instagram"],
    twitter: json["twitter"],
    youtube: json["youtube"],
  );

  Map<String, dynamic> toJson() => {
    "facebook": facebook,
    "instagram": instagram,
    "twitter": twitter,
    "youtube": youtube,
  };
}
