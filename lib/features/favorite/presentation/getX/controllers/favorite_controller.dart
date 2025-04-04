import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:yemen_offers/features/favorite/data/sources/favorite_remote_data_source.dart';

import '../../../domain/entities/favorite_entity.dart';
import '../../../domain/use_cases/get_favorites_use_case.dart';
import '../../../domain/use_cases/remove_from_favorite_use_case.dart';
import '../../../domain/use_cases/save_to_favorite_use_case.dart';

class FavoriteController extends GetxController {
  final FavoriteRepoImpl _favoriteRepo = FavoriteRepoImpl(
    FavoriteRemoteDataSourceImpl(ApiService()),
  );

  final Rx<List<FavoriteEntity>> favorites = Rx<List<FavoriteEntity>>([]);
  final Rx<bool> isLoading = Rx<bool>(false);

  @override
  void onInit() async {
    super.onInit();
    await _getFavorites();
  }

  Future<void> _getFavorites() async {
    isLoading(true);
    final GetFavoritesUseCase getFavoritesUseCase = GetFavoritesUseCase(
      _favoriteRepo,
    );
    final result = await getFavoritesUseCase.execute();
    result.fold(
      (failure) => Get.snackbar("erroe", failure.message),
      (favoritesEntity) => favorites(favoritesEntity),
    );
    isLoading(false);
  }

  Future<void> _saveToFavorites(String slug) async {
    final SaveToFavoriteUseCase saveToFavoriteUseCase = SaveToFavoriteUseCase(
      _favoriteRepo,
    );
    final result = await saveToFavoriteUseCase.execute(slug);
    result.fold(
      (failure) => Get.snackbar("erroe", failure.message),
      (_) => _getFavorites(),
    );
  }

  Future<void> _removeFromFavorites(int id) async {
    final RemoveFromFavoriteUseCase removeFromFavoriteUseCase =
        RemoveFromFavoriteUseCase(_favoriteRepo);
    final result = await removeFromFavoriteUseCase.execute(id);
    result.fold(
      (failure) => Get.snackbar("erroe", failure.message),
      (_) =>  _getFavorites(),
    );
    ;
  }

  static saveOffer(String slug) async {
    final FavoriteController favoriteController =
        Get.find<FavoriteController>();

    await favoriteController._saveToFavorites(slug);
  }

  static removeOffer(int id) async {
    final FavoriteController favoriteController =
        Get.find<FavoriteController>();
    await favoriteController._removeFromFavorites(id);
    favoriteController._getFavorites();
  }
}
