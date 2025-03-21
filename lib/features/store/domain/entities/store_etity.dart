import 'package:yemen_offers/features/store/data/models/store_model.dart';

List<StoreEntity> storeEntityFromModel(List<StoreModel> stores) {
  return stores.map((store) => StoreEntity.fromModel(store)).toList();
}

class StoreEntity {
  final String? slug;
  final String name;
  final String? description;
  final String? image;
  final String category;
  final String phone;
  final String? website;
  final String? address;
  final String? longitude;
  final String? latitude;
  final Map<String, dynamic>? socialMedia;
  final bool? isActive;

  const StoreEntity({
    required this.slug,
    required this.name,
    required this.description,
    this.image,
    required this.category,
    required this.phone,
    required this.website,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.socialMedia,
    required this.isActive,
  });

  factory StoreEntity.fromModel(StoreModel storeModel) {
    return StoreEntity(
      slug: storeModel.slug,
      name: storeModel.name,
      description: storeModel.description,
      image: storeModel.image,
      category: storeModel.category,
      phone: storeModel.phone,
      website: storeModel.website,
      address: storeModel.address,
      longitude: storeModel.longitude,
      latitude: storeModel.latitude,
      socialMedia: storeModel.socialMedia?.toJson(),
      isActive: storeModel.isActive,
    );
  }
}
