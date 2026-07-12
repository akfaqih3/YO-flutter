import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/favorite/domain/entities/favorite_entity.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, List<FavoriteEntity>>> getFavorites();
  Future<Either<Failure, void>> saveToFavorites(String slug);
  Future<Either<Failure, void>> removeFromFavorites(int id);
}
