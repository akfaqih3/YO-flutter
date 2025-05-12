import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/core/services/location_service.dart';
import 'package:yemen_offers/features/auth/data/data_sources/register_remote_data_source.dart';
import 'package:yemen_offers/features/auth/domain/repos/join_as_merchant_repo.dart';
import 'package:yemen_offers/features/profile/data/models/merchant_model.dart';
import 'package:dio/dio.dart' as dio;

class JoinAsMerchantRepoImpl implements JoinAsMerchantRepo {
  final RegisterRemoteDataSource registerRemoteDataSource;

  final LocationService locationService = Get.find<LocationService>();

  JoinAsMerchantRepoImpl({required this.registerRemoteDataSource});

  @override
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
  }) async {
    try {
      final dio.FormData data = await prepareDataForUpload(
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
        facebook: facebook,
        instagram: instagram,
        snapchat: snapchat,
      );

      await registerRemoteDataSource.joinAsMerchant(data);
      return right(null);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }

  Future<dio.FormData> prepareDataForUpload({
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
  }) async {
    final dio.FormData formData = dio.FormData.fromMap({
      ApiKeys.merchantPhone: phone,
      ApiKeys.merchantAddress: address,
      "${ApiKeys.store}.${ApiKeys.storeCategory}": storeCategory,
      "${ApiKeys.store}.${ApiKeys.storeName}": storeName,
      "${ApiKeys.store}.${ApiKeys.storePhone}": storePhone,
      if (storeDescription != null)
        "${ApiKeys.store}.${ApiKeys.storeDescription}": storeDescription,
      if (storeWebsite != null)
        "${ApiKeys.store}.${ApiKeys.storeWebsite}": storeWebsite,
      if (storeAddress != null)
        "${ApiKeys.store}.${ApiKeys.storeAddress}": storeAddress,
      if (storeLongitude != null)
        "${ApiKeys.store}.${ApiKeys.storeLongitude}": storeLongitude,
      if (storeLatitude != null)
        "${ApiKeys.store}.${ApiKeys.storeLatitude}": storeLatitude,
      if (storeImage != null)
        "${ApiKeys.store}.${ApiKeys.storeImage}": await dio
            .MultipartFile.fromFile(
          storeImage.path!,
          filename: storeImage.path!.split('/').last,
        ),
      if (facebook != null)
        "${ApiKeys.store}.${ApiKeys.storeSocialMedia}.${ApiKeys.facebookLink}":
            facebook,
      if (instagram != null)
        "${ApiKeys.store}.${ApiKeys.storeSocialMedia}.${ApiKeys.instagramLink}":
            instagram,
      if (snapchat != null)
        "${ApiKeys.store}.${ApiKeys.storeSocialMedia}.${ApiKeys.snapchatLink}":
            snapchat,
    });

    return formData;
  }
}
