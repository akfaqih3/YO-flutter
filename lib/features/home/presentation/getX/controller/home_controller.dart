import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';
import 'package:yemen_offers/features/home/data/repos/home_repo_impl.dart';
import 'package:yemen_offers/features/home/data/sources/home_remote_data_source.dart';
import 'package:yemen_offers/features/home/domain/entities/recommendations_offer_entity.dart';

class HomeController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  final BrowseController browseController = Get.find<BrowseController>();
  late final HomeRepoImpl _homeRepo;

  final RxList<CategoryEntity> categories = RxList<CategoryEntity>([]);

  RxList<RecommendationsOfferEntity> recommendationsOffers = RxList([]);
  @override
  void onInit() async {
    _homeRepo = HomeRepoImpl(HomeRemoteDataSourceImpl(_apiService));
    await getRecommendations();
    await getCategories();
    super.onInit();
  }

  Future<void> getRecommendations() async {
    final result = await _homeRepo.getRecommendations();
    result.fold(
      (failure) => Get.snackbar("error", failure.message),
      (success) => recommendationsOffers.value = success,
    );
  }

  Future<void> getCategories() async {
    final result = await browseController.getCategories();
    categories(result);
  }

}
