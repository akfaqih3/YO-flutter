import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/auth/domain/repos/join_as_merchant_repo.dart';
import 'package:yemen_offers/features/profile/domain/entities/merchant_entity.dart';

class JoinAsMerchantUseCase {
  final JoinAsMerchantRepo _joinAsMerchantRepo;

  JoinAsMerchantUseCase(this._joinAsMerchantRepo);

  Future<Either<Failure, MerchantEntity>> execute({
    required String phone,
    required String address,
    required String storeName,
    String? storeDescription,
    required String storeCategory,
    File? storeImage,
    required String storePhone,
    String? storeWebsite,
    String? storeAddress,
    double? storeLongitude,
    double? storeLatitude,
    String? facebookLink,
    String? instagramLink,
    String? snapchatLink,
  }) async {
    final response = await _joinAsMerchantRepo.JoinAsMerchant(
      phone: phone,
      address: address,
      storeName: storeName,
      storeDescription: storeDescription,
      storeCategory: storeCategory,
      storeImage: storeImage,
      storePhone: storePhone,
      storeWebsite: storeWebsite,
      storeAddress: storeAddress,
      storeLongitude: storeLongitude,
      storeLatitude: storeLatitude,
      facebook: facebookLink,
      instagram: instagramLink,
      snapchat: snapchatLink,
    );

    return response;
  }
}
