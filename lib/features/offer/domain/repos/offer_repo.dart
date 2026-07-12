import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/offer/domain/entities/merchant_offer_entity.dart';

abstract class OfferRepo {
  Future<Either<Failure, List<OfferCategoryEntity>>>
  getOfferCategoriesByCategory(String categorySlug);
  Future<Either<Failure, MerchantOfferEntity>> getOfferDetails(
    String storeSlug,
    String slug,
  );
  Future<Either<Failure, List<MerchantOfferEntity>>> getOffers(
    String storeSlug,
  );
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
  });
  Future<Either<Failure, void>> updateOffer(
    String storeSlug,
    String slug, {
    required String title,
    String? description,
    required String category,
    required File? image,
    required double? priceBefore,
    required double? priceAfter,
    required String? startDate,
    required String? endDate,
  });
  Future<Either<Failure, void>> deleteOffer(String storeSlug, String slug);
}
