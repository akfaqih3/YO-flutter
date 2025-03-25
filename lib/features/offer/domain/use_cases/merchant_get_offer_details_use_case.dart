import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/offer/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/offer/domain/repos/offer_repo.dart';

class MerchantGetOfferDetailsUseCase {
  final OfferRepo _offerRepo;
  MerchantGetOfferDetailsUseCase(this._offerRepo);

  Future<Either<Failure, OfferEntity>> execute(
    String storeSlug,
    String slug,
  ) async {
    return await _offerRepo.getOfferDetails(storeSlug, slug);
  }
}
