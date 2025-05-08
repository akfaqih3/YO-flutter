import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:yemen_offers/features/favorite/domain/repos/favorite_repo.dart';
import 'package:yemen_offers/features/favorite/domain/repos/share_offer_repo.dart';

class ShareOfferUserCase {
  final ShareOfferRepo _shareOfferRepo;

  ShareOfferUserCase(this._shareOfferRepo);

  Future<Either<Failure, void>> execute(String offerSlug) async {
    return await _shareOfferRepo.shareOfferUser(offerSlug);
  }
}
