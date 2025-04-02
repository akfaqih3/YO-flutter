import 'dart:io';

import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:yemen_offers/features/offer/data/models/offer_category_model.dart';
import 'package:yemen_offers/features/offer/data/models/merchant_offer_model.dart';
import 'package:yemen_offers/features/offer/data/sources/offer_remote_data_source.dart';
import 'package:yemen_offers/features/offer/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/offer/domain/entities/merchant_offer_entity.dart';
import 'package:yemen_offers/features/offer/domain/repos/offer_repo.dart';

class OfferRepoImpl implements OfferRepo {
  final OfferRemoteDataSource _remoteDataSource;

  OfferRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<OfferCategoryEntity>>>
  getOfferCategoriesByCategory(String categorySlug) async {
    try {
      final List<OfferCategoryModel> offerCategories = await _remoteDataSource
          .getOfferCategoriesByCategory(categorySlug);
      return Right(offerCategoryEntityFromModel(offerCategories));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, List<MerchantOfferEntity>>> getOffers(String storeSlug) async {
    try {
      final List<MerchantOfferModel> offers = await _remoteDataSource.getOffersByStore(
        storeSlug,
      );
      return Right(MerchantOfferEntityFromModel(offers));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, MerchantOfferEntity>> getOfferDetails(
    String storeSlug,
    String slug,
  ) async {
    try {
      final MerchantOfferModel offerModel = await _remoteDataSource.getOfferDetails(
        storeSlug,
        slug,
      );
      return Right(MerchantOfferEntity.fromModel(offerModel));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> addOffer(
    String storeSlug, {
    required String title,
    String? description,
    required String category,
    File? image,
    required double? priceBefore,
    required double? priceAfter,
    required String? startDate,
    required String? endDate,
  }) async {
    try {
      final Map<String, dynamic> offerData = {
        ApiKeys.offerTitle: title,
        ApiKeys.offerDescription: description,
        ApiKeys.offerCategory: category,
        ApiKeys.offerImage: image,
        ApiKeys.offerPriceBefore: priceBefore,
        ApiKeys.offerPriceAfter: priceAfter,
        ApiKeys.offerStartDate: startDate,
        ApiKeys.offerEndDate: endDate,
      };
      await _remoteDataSource.addOffer(storeSlug, offerData: offerData);
      return Right(null);
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> updateOffer(
    String storeSlug,
    String slug, {
    required String title,
    String? description,
    required String category,
    File? image,
    required double? priceBefore,
    required double? priceAfter,
    required String? startDate,
    required String? endDate,
  }) async {
    try {
      final Map<String, dynamic> offerData = {
        ApiKeys.offerTitle: title,
        ApiKeys.offerDescription: description,
        ApiKeys.offerCategory: category,
        ApiKeys.offerImage: image,
        ApiKeys.offerPriceBefore: priceBefore,
        ApiKeys.offerPriceAfter: priceAfter,
        ApiKeys.offerStartDate: startDate,
        ApiKeys.offerEndDate: endDate,
      };
      await _remoteDataSource.updateOffer(
        storeSlug,
        slug,
        offerData: offerData,
      );
      return Right(null);
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteOffer(
    String storeSlug,
    String slug,
  ) async {
    try {
      await _remoteDataSource.deleteOffer(storeSlug, slug);
      return Right(null);
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }
}
