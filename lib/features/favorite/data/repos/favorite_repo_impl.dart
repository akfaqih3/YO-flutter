import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/favorite/data/sources/favorite_remote_data_source.dart';
import 'package:yemen_offers/features/favorite/domain/entities/favorite_entity.dart';
import 'package:yemen_offers/features/favorite/domain/repos/favorite_repo.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  final FavoriteRemoteDataSource _favoriteRemoteDataSource;

  FavoriteRepoImpl(this._favoriteRemoteDataSource);
  

  @override
  Future<Either<Failure, List<FavoriteEntity>>> getFavorites() async {
    try {
      final favorites = await _favoriteRemoteDataSource.getFavorites();
      return right(favoriteEntityFromModel(favorites));
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> saveToFavorites(String slug) async {
     try {
      await _favoriteRemoteDataSource.saveToFavorites(slug);
      return right(null);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromFavorites(int id) async {
    try {
      await _favoriteRemoteDataSource.removeFromFavorites(id);
      return right(null);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }
}
