import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/favorite/data/models/favorite_model.dart';

abstract class FavoriteRemoteDataSource {
  Future<List<FavoriteModel>> getFavorites();
  Future<void> saveToFavorites(String slug);
  Future<void> removeFromFavorites(int id);
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  final ApiService _apiService;

  FavoriteRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<FavoriteModel>> getFavorites() async {
    final response = await _apiService.get(Endpoint.favorites);
    return FavoriteModelFromJson(response.data);
  }

  @override
  Future<void> saveToFavorites(String slug) async {
    await _apiService.post(Endpoint.favorites, data: {ApiKeys.offerSlug: slug});
  }

  @override
  Future<void> removeFromFavorites(int id) async {
    await _apiService.delete(Endpoint.favoritesDelete(id));
  }
}
