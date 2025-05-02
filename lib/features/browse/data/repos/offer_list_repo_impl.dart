import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/data/models/offer_model.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/data/sources/offer_list_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/repos/offer_list_repo.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';

class OfferListRepoImpl implements OfferListRepo {
  final OfferListRemoteDataSourceImpl _remoteDataSource;

  OfferListRepoImpl(this._remoteDataSource);

  Future<Either<Failure, List<OfferEntity>>> _getOffers(
    Future<List<OfferModel>> Function({dynamic queryParams}) requestFn,
    Map<String, dynamic> queryParams,
  ) async {
    try {
      final List<OfferModel> offers = await requestFn(queryParams: queryParams);
      return Right(offerEntityFromModel(offers));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  Map<String, dynamic> _buildQueryParams({
    String? search,
    List<String>? offerCategory,
    List<String>? category,
    List<String>? storeSlug,
    RangeValues? price,
    RangeValues? priceBefore,
    DateTimeRange? startDate,
    DateTimeRange? endDate,
    double? discount,
    String? ordering,
    double? latitude,
    double? longitude,
    int index = 0,
    int size = 10,
  }) {
    return {
      ApiKeys.searchParam: search,
      ApiKeys.offerCategoryParam: offerCategory,
      ApiKeys.categoryParam: category,
      ApiKeys.storeSlugParam: storeSlug,
      ApiKeys.priceMinParam: price?.start,
      ApiKeys.priceMaxParam: price?.end,
      ApiKeys.priceBeforeMinParam: priceBefore?.start,
      ApiKeys.priceBeforeMaxParam: priceBefore?.end,
      ApiKeys.startDateMinParam: startDate?.start,
      ApiKeys.startDateMaxParam: startDate?.end,
      ApiKeys.endDateMinParam: endDate?.start,
      ApiKeys.endDateMaxParam: endDate?.end,
      ApiKeys.discountParam: discount,
      ApiKeys.orderingParam: ordering,
      ApiKeys.latitudeParam: latitude,
      ApiKeys.longitudeParam: longitude,
      ApiKeys.indexParam: index,
      ApiKeys.sizeParam: size,
    };
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> getOfferList({
    String? search,
    List<String>? offerCategory,
    List<String>? category,
    List<String>? storeSlug,
    RangeValues? price,
    RangeValues? priceBefore,
    DateTimeRange? startDate,
    DateTimeRange? endDate,
    double? discount,
    String? ordering,
    double? latitude,
    double? longitude,
    int index = 0,
    int size = 10,
  }) async {
    final queryParams = _buildQueryParams(
      search: search,
      offerCategory: offerCategory,
      category: category,
      storeSlug: storeSlug,
      price: price,
      priceBefore: priceBefore,
      startDate: startDate,
      endDate: endDate,
      discount: discount,
      ordering: ordering,
      latitude: latitude,
      longitude: longitude,
      index: index,
      size: size,
    );

    return _getOffers(_remoteDataSource.getOfferList, queryParams);
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> getOffersLatest({
    String? search,
    List<String>? offerCategory,
    List<String>? category,
    List<String>? storeSlug,
    RangeValues? price,
    RangeValues? priceBefore,
    DateTimeRange? startDate,
    DateTimeRange? endDate,
    double? discount,
    String? ordering,
    double? latitude,
    double? longitude,
    int index = 0,
    int size = 10,
  }) async {
    final queryParams = _buildQueryParams(
      search: search,
      offerCategory: offerCategory,
      category: category,
      storeSlug: storeSlug,
      price: price,
      priceBefore: priceBefore,
      startDate: startDate,
      endDate: endDate,
      discount: discount,
      ordering: ordering,
      latitude: latitude,
      longitude: longitude,
      index: index,
      size: size,
    );

    return _getOffers(_remoteDataSource.getOffersLatest, queryParams);
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> getOffersMostPopular({
    String? search,
    List<String>? offerCategory,
    List<String>? category,
    List<String>? storeSlug,
    RangeValues? price,
    RangeValues? priceBefore,
    DateTimeRange? startDate,
    DateTimeRange? endDate,
    double? discount,
    String? ordering,
    double? latitude,
    double? longitude,
    int index = 0,
    int size = 10,
  }) async {
    final queryParams = _buildQueryParams(
      search: search,
      offerCategory: offerCategory,
      category: category,
      storeSlug: storeSlug,
      price: price,
      priceBefore: priceBefore,
      startDate: startDate,
      endDate: endDate,
      discount: discount,
      ordering: ordering,
      latitude: latitude,
      longitude: longitude,
      index: index,
      size: size,
    );

    return _getOffers(_remoteDataSource.getOffersMostPopular, queryParams);
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> getOffersNearby({
    String? search,
    List<String>? offerCategory,
    List<String>? category,
    List<String>? storeSlug,
    RangeValues? price,
    RangeValues? priceBefore,
    DateTimeRange? startDate,
    DateTimeRange? endDate,
    double? discount,
    String? ordering,
    required double latitude,
    required double longitude,
    int index = 0,
    int size = 10,
  }) async {
    final queryParams = _buildQueryParams(
      search: search,
      offerCategory: offerCategory,
      category: category,
      storeSlug: storeSlug,
      price: price,
      priceBefore: priceBefore,
      startDate: startDate,
      endDate: endDate,
      discount: discount,
      ordering: ordering,
      latitude: latitude,
      longitude: longitude,
      index: index,
      size: size,
    );

    return _getOffers(_remoteDataSource.getOffersNearby, queryParams);
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> getOffersRecommendations({
    limit = 3,
  }) async {
    final queryParams = {ApiKeys.limit: limit};
    return _getOffers(_remoteDataSource.getOffersRecommendations, queryParams);
  }
}
