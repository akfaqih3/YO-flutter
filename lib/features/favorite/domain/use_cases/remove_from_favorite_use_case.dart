import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/favorite/domain/repos/favorite_repo.dart';

class RemoveFromFavoriteUseCase {
  final FavoriteRepo _favoriteRepo;
  RemoveFromFavoriteUseCase(this._favoriteRepo);

  Future<Either<Failure, void>> execute(int id) async {
    return await _favoriteRepo.removeFromFavorites(id);
  }
}