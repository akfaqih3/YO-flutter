import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/profile/data/models/merchant_model.dart';

abstract class JoinAsMerchantRepo {
  Future<Either<Failure, void>> JoinAsMerchant({
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
    String? facebook,
    String? instagram,
    String? snapchat,
  });
}
