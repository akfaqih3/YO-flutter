import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/sources/browse_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offers_by_store_use_case.dart';

class StoreDetailsController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  late BrowseRepoImpl _browseRepoImpl;

  final Rx<StoreEntity?> store = Rx<StoreEntity?>(null);
  final Rx<List<OfferEntity>> offers = Rx<List<OfferEntity>>([]);

  final isOffersLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initRepoImpl();
    getArguments();
    _browseRepoImpl = BrowseRepoImpl(BrowseRemoteDataSourceImpl(_apiService));
  }

  void _initRepoImpl() {
    _browseRepoImpl = BrowseRepoImpl(BrowseRemoteDataSourceImpl(_apiService));
  }

  void getArguments() {
    store(Get.arguments[ApiKeys.store]);
  }

  @override
  void onReady() async {
    super.onReady();
    await getOffers();
  }

  Future<void> getOffers() async {
    if (store.value == null) return;
    isOffersLoading(true);
    final GetOffersByStoreUseCase getOffersByStoreUseCase =
        GetOffersByStoreUseCase(_browseRepoImpl);

    final result = await getOffersByStoreUseCase.execute(store.value!.slug);
    result.fold(
      (failure) {
        Get.snackbar("error", failure.message);
      },
      (success) {
        offers(success);
      },
    );
    isOffersLoading(false);
  }
}
