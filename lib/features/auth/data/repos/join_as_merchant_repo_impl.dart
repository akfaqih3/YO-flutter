import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/core/services/location_service.dart';
import 'package:yemen_offers/features/auth/data/data_sources/login_local_data_source.dart';
import 'package:yemen_offers/features/auth/data/data_sources/register_remote_data_source.dart';
import 'package:yemen_offers/features/auth/data/models/login_model.dart';
import 'package:yemen_offers/features/auth/domain/repos/join_as_merchant_repo.dart';
import 'package:yemen_offers/features/profile/data/models/merchant_model.dart';
import 'package:dio/dio.dart' as dio;

import '../../domain/repos/register_repo.dart';

class JoinAsMerchantRepoImpl implements JoinAsMerchantRepo {
  final RegisterRemoteDataSource registerRemoteDataSource;

  final LocationService locationService = Get.find<LocationService>();

  JoinAsMerchantRepoImpl({required this.registerRemoteDataSource});

  @override
  Future<Either<Failure, MerchantModel>> JoinAsMerchant({
    required String phone,
    required String address,
    required String storeName,
    required String storeDescription,
    required String storeCategory,
    File? storeImage,
    required String storePhone,
    String? storeWebsite,
    String? storeAddress,
    double? storeLongitude,
    double? storeLatitude,
    Map<String, String?>? socialMedia,
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
        socialMedia: socialMedia,
      );

      final dynamic response = await registerRemoteDataSource.joinAsMerchant(
        data,
      );
      return right(MerchantModel.fromJson(response));
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }

  Future<dio.FormData> prepareDataForUpload({
    required String phone,
    required String address,
    required String storeName,
    required String storeDescription,
    required String storeCategory,
    File? storeImage,
    required String storePhone,
    String? storeWebsite,
    String? storeAddress,
    double? storeLongitude,
    double? storeLatitude,
    Map<String, String?>? socialMedia,
  }) async {
    final Map<String, dynamic> data = {
      ApiKeys.merchantphone: phone,
      ApiKeys.merchantaddress: address,
      ApiKeys.storeName: storeName,
      ApiKeys.storeImage: storeImage,
      ApiKeys.storeDescription: storeDescription,
      ApiKeys.storeCategory: storeCategory,
      ApiKeys.storePhone: storePhone,
      ApiKeys.storeWebsite: storeWebsite,
      ApiKeys.storeAddress: storeAddress,
      ApiKeys.storeLongitude: storeLongitude,
      ApiKeys.storeLatitude: storeLatitude,
      ApiKeys.storeSocialMedia: jsonEncode(socialMedia),
    };

    if (storeImage != null && storeImage.path != null) {
      data[ApiKeys.storeImage] = await dio.MultipartFile.fromFile(
        storeImage.path!,
        filename: storeImage.path!.split('/').last,
      );
    }

    final dio.FormData formData = dio.FormData.fromMap(data);

    return formData;
  }
}
