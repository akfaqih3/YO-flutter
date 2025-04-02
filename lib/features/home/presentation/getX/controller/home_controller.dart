import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/home/data/repos/home_repo_impl.dart';
import 'package:yemen_offers/features/home/data/sources/home_remote_data_source.dart';
import 'package:yemen_offers/features/home/domain/entities/recommendations_offer_entity.dart';

class HomeController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  late final HomeRepoImpl _homeRepo;


  RxList<RecommendationsOfferEntity> recommendationsOffers = RxList([]);
  @override
  void onInit() async {
    _homeRepo = HomeRepoImpl(HomeRemoteDataSourceImpl(_apiService));
    await getRecommendations();
    super.onInit();
  }

  Future<void> getRecommendations() async {
    final result = await _homeRepo.getRecommendations();
    result.fold(
      (failure) => Get.snackbar("error", failure.message),
      (success) => recommendationsOffers.value = success,
    );
  }

}
