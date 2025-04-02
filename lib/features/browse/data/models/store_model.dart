List<StoreModel> storeModelFromJson(List<dynamic> json) =>
    List<StoreModel>.from(json.map((x) => StoreModel.fromJson(x)));

///Store
class StoreModel {
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

  StoreModel({
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
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
    address: json["address"],
    description: json["description"],
    image: json["image"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    name: json["name"],
    phone: json["phone"],
    slug: json["slug"],
    socialMedia:
        json["social_media"] == null
            ? null
            : SocialMediaModel.fromJson(json["social_media"]),
    website: json["website"],
  );

  Map<String, dynamic> toJson() => {
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
  String? twitter;
  String? youtube;

  SocialMediaModel({this.facebook, this.instagram, this.twitter, this.youtube});

  factory SocialMediaModel.fromJson(Map<String, dynamic> json) => SocialMediaModel(
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
