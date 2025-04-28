import 'package:yemen_offers/features/browse/data/models/store_model.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';

List<StoreEntity> storeEntityFromModel(List<StoreModel> stores) {
  return stores.map((store) => StoreEntity.fromModel(store)).toList();
}

///Store
class StoreEntity {
  CategoryEntity category;
  String? address;
  String? description;
  String? image;
  String? latitude;
  String? longitude;
  String name;
  String? phone;
  String slug;
  StoreSocialMediaEntity? socialMedia;
  String? website;

  StoreEntity({
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
  });

  factory StoreEntity.fromModel(StoreModel storeModel) => StoreEntity(
    category: CategoryEntity.fromModel(storeModel.category),
    address: storeModel.address,
    description: storeModel.description,
    image: storeModel.image,
    latitude: storeModel.latitude,
    longitude: storeModel.longitude,
    name: storeModel.name,
    phone: storeModel.phone,
    slug: storeModel.slug,
    socialMedia:
        storeModel.socialMedia == null
            ? null
            : StoreSocialMediaEntity.fromModel(storeModel.socialMedia!),
    website: storeModel.website,
  );
}

///SocilaMediaOutput
class StoreSocialMediaEntity {
  String? facebook;
  String? instagram;
  String? twitter;
  String? youtube;

  StoreSocialMediaEntity({
    this.facebook,
    this.instagram,
    this.twitter,
    this.youtube,
  });

  factory StoreSocialMediaEntity.fromModel(SocialMediaModel socialMediaModel) =>
      StoreSocialMediaEntity(
        facebook: socialMediaModel.facebook,
        instagram: socialMediaModel.instagram,
        twitter: socialMediaModel.twitter,
        youtube: socialMediaModel.youtube,
      );
}
