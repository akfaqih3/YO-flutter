import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/store/domain/repos/store_repo.dart';

class UpdateStoreUseCase {
  final StoreRepo _storeRepo;
  UpdateStoreUseCase(this._storeRepo);

  Future<Either<Failure, void>> execute(
   { required String slug,
    required String name,
    String? description,
    required String category,
    File? image,
    required String phone,
    String? website,
    String? address,
    double? longitude,
    double? latitude,
    Map<String, String>? socialMedia,}
  ) async {
    return await _storeRepo.updateStore(
      slug,
      name,
      description,
      category,
      image,
      phone,
      website,
      address,
      longitude,
      latitude,
      socialMedia,
    );
  }
}
