import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';

abstract class OfferListRepo {
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
  });

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
  });
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
  });
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
  });

  Future<Either<Failure, List<OfferEntity>>> getOffersRecommendations(
    {
      limit = 3,
    }
  );


}
