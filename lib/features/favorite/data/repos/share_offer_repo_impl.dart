import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/favorite/data/sources/share_offer_remote_data_source.dart';
import 'package:yemen_offers/features/favorite/domain/repos/share_offer_repo.dart';

class ShareOfferRepoImpl implements ShareOfferRepo {
  final ShareOfferRemoteDataSource _remoteDataSource;

  ShareOfferRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, void>> shareOfferUser(String offerSlug) async {
    try {
      await _remoteDataSource.shareOfferUser(offerSlug);
      return right(null);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }
}
