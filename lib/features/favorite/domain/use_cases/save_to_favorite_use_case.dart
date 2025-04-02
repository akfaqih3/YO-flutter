import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/favorite/domain/repos/favorite_repo.dart';

class SaveToFavoriteUseCase {
  final FavoriteRepo _favoriteRepo;
  SaveToFavoriteUseCase(this._favoriteRepo);

  Future<Either<Failure, void>> execute(String slug) async {
    return await _favoriteRepo.saveToFavorites(slug);
  }
}