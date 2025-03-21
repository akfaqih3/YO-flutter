import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/store/data/models/store_model.dart';
import 'package:yemen_offers/features/store/domain/entities/store_etity.dart';
import 'package:yemen_offers/features/store/domain/repos/store_repo.dart';

class AddStoreUseCase {
  final StoreRepo _storeRepos;
  AddStoreUseCase(this._storeRepos);

  Future<Either<Failure, void>> execute({
    required String name,
    String? description,
    required String category,
    File? image,
    required String phone,
    String? website,
    String? address,
    double? longitude,
    double? latitude,
    Map<String, String>? socialMedia,
  }) async {
    return await _storeRepos.addStore(
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
