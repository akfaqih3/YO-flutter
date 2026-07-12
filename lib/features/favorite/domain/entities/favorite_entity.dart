import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/favorite/data/models/favorite_model.dart';

List<FavoriteEntity> favoriteEntityFromModel(List<FavoriteModel> favorites) {
  return favorites
      .map((favorite) => FavoriteEntity.fromModel(favorite))
      .toList();
}

class FavoriteEntity {
  final int id;
  final OfferEntity offer;
  final DateTime createdAt;

  FavoriteEntity({
    required this.id,
    required this.offer,
    required this.createdAt,
  });

  factory FavoriteEntity.fromModel(FavoriteModel favoriteModel) =>
      FavoriteEntity(
        id: favoriteModel.id,
        offer: OfferEntity.fromModel(favoriteModel.offer),
        createdAt: favoriteModel.createdAt,
      );
}
