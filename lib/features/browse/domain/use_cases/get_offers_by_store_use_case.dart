import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';

class GetOffersByStoreUseCase {
  final BrowseRepoImpl _browseRepoImpl;
  GetOffersByStoreUseCase(this._browseRepoImpl);

  Future<Either<Failure, List<OfferEntity>>> execute(String storeSlug) async {
    return await _browseRepoImpl.getOffersByStore(storeSlug);
  }
}