import 'package:get/get.dart';
import 'package:yemen_offers/core/common/services/network_service.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/sources/browse_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offers_latest_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offers_most_popular_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_stores_use_case.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/categories_controller.dart';
import 'package:yemen_offers/features/favorite/presentation/getX/controllers/favorite_controller.dart';
import 'package:yemen_offers/features/browse/data/repos/offer_list_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/sources/offer_list_remote_data_source.dart';
import 'package:yemen_offers/features/home/domain/entities/recommendations_offer_entity.dart';

class HomeController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  final CategoriesController categoriesController =
      Get.find<CategoriesController>();
  late final OfferListRepoImpl _offerListRepoImpl;
  late final BrowseRepoImpl _browseRepoImpl;

  RxList<CategoryEntity> categories = RxList([]);
  RxList<OfferEntity> recommendationsOffers = RxList([]);
  RxList<OfferEntity> mostPopularOffers = RxList([]);
  RxList<OfferEntity> latestOffers = RxList([]);
  RxList<StoreEntity> stores = RxList([]);

  RxBool isMostPopularOffersLoading = true.obs;
  RxBool isLatestOffersLoading = true.obs;
  RxBool isStoresLoading = true.obs;

  final NetworkService networkService = Get.find<NetworkService>();

  @override
  void onInit() async {
    super.onInit();

    _offerListRepoImpl = OfferListRepoImpl(
      OfferListRemoteDataSourceImpl(_apiService),
    );
    _browseRepoImpl = BrowseRepoImpl(BrowseRemoteDataSourceImpl(_apiService));

    await getRecommendations();
    await getStores();
    await getCategories();
    await getMostPopularOffers();
    await getLatestOffers();
    if (!networkService.isConnected.value) {
      Get.offAllNamed(AppRoutes.noInternet);
    }
  }

  Future<void> getRecommendations() async {
    final result = await _offerListRepoImpl.getOffersRecommendations(limit: 3);
    result.fold(
      (failure) => Get.snackbar("error", failure.message),
      (success) => recommendationsOffers.value = success,
    );
  }

  Future<void> getCategories() async {
    final result = await categoriesController.getCategories();
    categories(result);
  }

  Future<void> getMostPopularOffers() async {
    isMostPopularOffersLoading(true);
    GetOffersMostPopularUseCase getOffersMostPopularUseCase =
        GetOffersMostPopularUseCase(_offerListRepoImpl);
    final result = await getOffersMostPopularUseCase.execute();
    result.fold(
      (failure) => Get.snackbar("error", failure.message),
      (success) => mostPopularOffers.value = success,
    );
    isMostPopularOffersLoading(false);
  }

  Future<void> getLatestOffers() async {
    isLatestOffersLoading(true);
    GetOffersLatestUseCase getOffersLatestUseCase = GetOffersLatestUseCase(
      _offerListRepoImpl,
    );
    final result = await getOffersLatestUseCase.execute();
    result.fold(
      (failure) => Get.snackbar("error", failure.message),
      (success) => latestOffers.value = success,
    );
    isLatestOffersLoading(false);
  }

  Future<void> getStores() async {
    isStoresLoading(true);
    final GetStoresUseCase getStoresUseCase = GetStoresUseCase(_browseRepoImpl);
    final result = await getStoresUseCase.execute();
    result.fold(
      (failure) => Get.snackbar("error", failure.message),
      (success) => stores.value = success,
    );
    isStoresLoading(false);
  }

  Future<void> refreshPage() async {
    if (networkService.isConnected.value) {
      await getRecommendations();
      await getCategories();
      await getStores();
      await getMostPopularOffers();
      await getLatestOffers();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
