import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/search/data/repos/search_repo_impl.dart';

class SearchOffersByImageUseCase {
  final SearchRepoImpl _searchRepoImpl;
  SearchOffersByImageUseCase(this._searchRepoImpl);

  Future<Either<Failure, List<OfferEntity>>> execute(File image) async {
    return await _searchRepoImpl.searchOffesByImage(image);
  }
}