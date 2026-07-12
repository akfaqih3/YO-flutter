import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/favorite/domain/entities/favorite_entity.dart';
import 'package:yemen_offers/features/favorite/domain/repos/favorite_repo.dart';

class GetFavoritesUseCase {
  final FavoriteRepo _favoriteRepo;
  GetFavoritesUseCase(this._favoriteRepo);

  Future<Either<Failure, List<FavoriteEntity>>> execute() async {
    return await _favoriteRepo.getFavorites();
  }
}
