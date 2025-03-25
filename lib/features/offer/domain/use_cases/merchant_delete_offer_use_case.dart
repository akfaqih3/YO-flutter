import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/offer/domain/repos/offer_repo.dart';

class MerchantDeleteOfferUseCase {
  final OfferRepo _offerRepo;
  MerchantDeleteOfferUseCase(this._offerRepo);

  Future<Either<Failure, void>> execute(String storeSlug, String slug) async {
    return await _offerRepo.deleteOffer(storeSlug, slug);
  }
}     