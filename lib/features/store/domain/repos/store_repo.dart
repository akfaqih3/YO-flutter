import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/store/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/store/domain/entities/store_etity.dart';

abstract class StoreRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, StoreEntity>> getStoreDetails(String slug);
  Future<Either<Failure, List<StoreEntity>>> getStores();
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
  );
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
  );
  Future<Either<Failure, void>> deleteStore(String slug);
}
