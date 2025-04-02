import 'package:yemen_offers/features/favorite/data/models/favorie_model.dart';

List<FavoriteEntity> favoriteEntityFromModel(List<FavoriteModel> favorites) {
  return favorites.map((favorite) => FavoriteEntity.fromModel(favorite)).toList();
}

class FavoriteEntity {
  final String category;
  final String description;
  final String discountPercentage;
  final String endDate;
  final int id;
  final String image;
  final String priceAfter;
  final String priceBefore;
  final String slug;
  final String startDate;
  final String title;

  const FavoriteEntity({
    required this.category,
    required this.description,
    required this.discountPercentage,
    required this.endDate,
    required this.id,
    required this.image,
    required this.priceAfter,
    required this.priceBefore,
    required this.slug,
    required this.startDate,
    required this.title,
  });

  factory FavoriteEntity.fromModel(FavoriteModel favoriteModel) {
    return FavoriteEntity(
      category: favoriteModel.category,
      description: favoriteModel.description,
      discountPercentage: favoriteModel.discountPercentage,
      endDate: favoriteModel.endDate,
      id: favoriteModel.id,
      image: favoriteModel.image,
      priceAfter: favoriteModel.priceAfter,
      priceBefore: favoriteModel.priceBefore,
      slug: favoriteModel.slug,
      startDate: favoriteModel.startDate,
      title: favoriteModel.title,
    );
  }
}
