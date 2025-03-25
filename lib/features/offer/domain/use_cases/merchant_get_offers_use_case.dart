import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/offer/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/offer/domain/repos/offer_repo.dart';

class MerchantGetOffersUseCase {
  final OfferRepo _offerRepo;
  MerchantGetOffersUseCase(this._offerRepo);

  Future<Either<Failure, List<OfferEntity>>> execute(String storeSlug) async {
    return await _offerRepo.getOffers(storeSlug);
  }
}