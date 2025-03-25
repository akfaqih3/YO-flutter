import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/offer/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/offer/domain/repos/offer_repo.dart';

class MerchantUpdateOfferUseCase {
  final OfferRepo _offerRepo;
  MerchantUpdateOfferUseCase(this._offerRepo);

  Future<Either<Failure, void>> execute(
    String storeSlug, String slug, {
    required String title,
    String? description,
    required String category,
    File? image,
    required double? priceBefore,
    required double? priceAfter,
    required String? startDate,
    required String? endDate,
  }) async {
    return await _offerRepo.updateOffer(
      storeSlug,
      slug,
      title: title,
      description: description,
      category: category,
      image: image,
      priceBefore: priceBefore,
      priceAfter: priceAfter,
      startDate: startDate,
      endDate: endDate,
    );
  }
}