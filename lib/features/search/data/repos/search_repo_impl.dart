import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/data/models/offer_model.dart';
import 'package:yemen_offers/features/search/data/sources/search_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/search/domain/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource _remoteDataSource;

  SearchRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<OfferEntity>>> searchOffesByKeyword(
    String searchKeyword,
  ) async {
    try {
      final List<OfferModel> offers = await _remoteDataSource
          .searchOffersByKeyword(searchKeyword);
      return Right(offerEntityFromModel(offers));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> searchOffesByImage(
    File image,
  ) async {
    try {
      final List<OfferModel> offers = await _remoteDataSource
          .searchOffersByImage(image);
      return Right(offerEntityFromModel(offers));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }
}