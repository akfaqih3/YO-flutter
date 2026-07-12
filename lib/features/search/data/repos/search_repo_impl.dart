import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/data/models/offer_model.dart';
import 'package:yemen_offers/features/search/data/offers_response_model.dart';
import 'package:yemen_offers/features/search/data/sources/search_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/search/domain/entities/offers_response_entity.dart';
import 'package:yemen_offers/features/search/domain/repos/search_repo.dart';
import 'package:dio/dio.dart' as dio;

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource _remoteDataSource;

  SearchRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, OffersResponseEntity>> searchOffesByKeyword(
    String searchKeyword,
  ) async {
    try {
      final Map<String, dynamic> queryParams = {
        ApiKeys.searchVectorParam: searchKeyword,
      };
      final OffersResponseModel offersResponeModel = await _remoteDataSource
          .searchOffersByKeyword(queryParams);

      return Right(OffersResponseEntity.fromModel(offersResponeModel));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, OffersResponseEntity>> searchOffesByImage(
    File image,
  ) async {
    try {
      final dio.FormData formData = dio.FormData.fromMap({
        ApiKeys.searchImageParam: await dio.MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });

      final OffersResponseModel offers = await _remoteDataSource
          .searchOffersByImage(formData);
      return Right(OffersResponseEntity.fromModel(offers));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }
}
