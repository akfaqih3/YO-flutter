
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/data/repos/offer_list_repo_impl.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';

class GetOfferListUseCase {
  final OfferListRepoImpl _repoImpl;

  GetOfferListUseCase( this._repoImpl);

  Future<Either<Failure, List<OfferEntity>>> execute({
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
    return _repoImpl.getOfferList(
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
  }
}
