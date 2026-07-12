import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:yemen_offers/features/store/data/models/merchant_store_model.dart';

List<MerchantStoreEtity> MerchantStoreEtityFromModel(List<MerchantStoreModel> stores) {
  return stores.map((store) => MerchantStoreEtity.fromModel(store)).toList();
}

class MerchantStoreEtity {
  final String? slug;
  final String name;
  final String? description;
  final String? image;
  final CategoryEntity category;
  final String phone;
  final String? website;
  final String? address;
  final double? longitude;
  final double? latitude;
  final StoreSocialMediaEntity? socialMedia;
  final bool? isActive;
  final int? totalOffers;

  const MerchantStoreEtity({
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
    this.totalOffers,
  });

  factory MerchantStoreEtity.fromModel(MerchantStoreModel storeModel) {
    return MerchantStoreEtity(
      slug: storeModel.slug,
      name: storeModel.name,
      description: storeModel.description,
      image: storeModel.image,
      category: CategoryEntity.fromModel(storeModel.category),
      phone: storeModel.phone,
      website: storeModel.website,
      address: storeModel.address,
      longitude: storeModel.longitude,
      latitude: storeModel.latitude,
      socialMedia: storeModel.socialMedia == null
          ? null
          : StoreSocialMediaEntity.fromModel(storeModel.socialMedia!),
      isActive: storeModel.isActive,
      totalOffers: storeModel.totalOffers,
    );
  }
}
