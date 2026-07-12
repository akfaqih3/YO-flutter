import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/domain/repos/browse_repo.dart';

class GetOfferDetailsUseCase {
  final BrowseRepo _browseRepo;

  GetOfferDetailsUseCase(this._browseRepo);

  Future<Either<Failure, OfferEntity>> execute(
    String offerSlug,
  ) async {
    return await _browseRepo.getOfferDetails(offerSlug);
  }
}
