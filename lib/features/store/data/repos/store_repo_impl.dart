import 'dart:convert';
import 'dart:io';

import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:yemen_offers/features/store/data/models/category_model.dart';
import 'package:yemen_offers/features/store/data/models/store_model.dart';
import 'package:yemen_offers/features/store/data/sources/store_remote_data_source.dart';
import 'package:yemen_offers/features/store/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/store/domain/entities/store_etity.dart';
import 'package:yemen_offers/features/store/domain/repos/store_repo.dart';

class StoreRepoImpl implements StoreRepo {
  final StoreRemoteDataSource _remoteDataSource;

  StoreRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final List<CategoryModel> categories =
          await _remoteDataSource.getCategories();
      return Right(categoryEntityFromModel(categories));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, List<StoreEntity>>> getStores() async {
    try {
      final List<StoreModel> stores = await _remoteDataSource.getStores();
      return Right(storeEntityFromModel(stores));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> addStore(
    String name,
    String? description,
    String category,
    File? image,
    String phone,
    String? website,
    String? address,
    double? longitude,
    double? latitude,
    Map<String, String>? socialMedia,
  ) async {
    try {
      final Map<String, dynamic> storeData = {
        ApiKeys.storeName: name,
        ApiKeys.storeDescription: description,
        ApiKeys.storeCategory: category,
        ApiKeys.storeImage: image,
        ApiKeys.storePhone: phone,
        ApiKeys.storeWebsite: website,
        ApiKeys.storeAddress: address,
        ApiKeys.storeLongitude: longitude,
        ApiKeys.storeLatitude: latitude,
        ApiKeys.storeSocialMedia: jsonEncode(socialMedia),
      };
      await _remoteDataSource.addStore(storeData);
      return Right(null);
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> updateStore(
    String slug,
    String name,
    String? description,
    String category,
    File? image,
    String phone,
    String? website,
    String? address,
    double? longitude,
    double? latitude,
    Map<String, String>? socialMedia,
  ) async {
    try {
      final Map<String, dynamic> storeData = {
        ApiKeys.storeName: name,
        ApiKeys.storeDescription: description,
        ApiKeys.storeCategory: category,
        ApiKeys.storeImage: image,
        ApiKeys.storePhone: phone,
        ApiKeys.storeWebsite: website,
        ApiKeys.storeAddress: address,
        ApiKeys.storeLongitude: longitude,
        ApiKeys.storeLatitude: latitude,
        ApiKeys.storeSocialMedia: jsonEncode(socialMedia),
      };
      await _remoteDataSource.updateStore(slug, storeData);
      return Right(null);
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteStore(String slug) async {
    try {
      await _remoteDataSource.deleteStore(slug);
      return Right(null);
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, StoreEntity>> getStoreDetails(String slug) async {
    try {
      final StoreModel storeModel = await _remoteDataSource.getStoreDetails(
        slug,
      );
      return Right(StoreEntity.fromModel(storeModel));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }
}
