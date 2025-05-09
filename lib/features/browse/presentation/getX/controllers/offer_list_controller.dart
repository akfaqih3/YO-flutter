import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/common/controllers/offers_filters_controller.dart';
import 'package:yemen_offers/core/constants/app_enums.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/repos/offer_list_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/sources/browse_remote_data_source.dart';
import 'package:yemen_offers/features/browse/data/sources/offer_list_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_categories_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offer_categories_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offers_latest_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offers_most_popular_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offers_nearby_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_stores_use_case.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/home_controller.dart';

class OfferListController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  late OfferListRepoImpl _offerListRepoImpl;

  final RxString pageTitle = "".obs;
  final Rx<OfferListType> offerListType = OfferListType.latest.obs;

  final RxList<CategoryEntity> categories = RxList([]);
  final RxList<StoreEntity> stores = RxList([]);
  final RxList<OfferCategoryEntity> offerCategories = RxList([]);

  final RxList<String> selectedCategories = RxList([]);
  final RxList<String> selectedStores = RxList([]);
  final RxList<String> selectedOfferCategories = RxList([]);

  final RxList<OfferEntity> offers = RxList([]);

  RxBool offersIsLoading = true.obs;

  // query params
  final Rx<OfferListOrderBy> sortBy = OfferListOrderBy.priceBefore.obs;
  bool isAscending = true;
  RxString searchQuery = "".obs;
  int index = 0;
  int size = 10;

  // filters
  final Rx<RangeValues> price = RangeValues(0, 0).obs;
  final Rx<RangeValues> priceBefore = RangeValues(0, 0).obs;
  final Rx<RangeValues> startDate = RangeValues(0, 0).obs;
  final Rx<RangeValues> endDate = RangeValues(0, 0).obs;
  final RxDouble discount = 0.0.obs;
  final Rx<double> latitudeParam = 0.0.obs;
  final Rx<double> longitudeParam = 0.0.obs;

  final OffersFiltersController offersFiltersController =
      OffersFiltersController();

  get scrollController => null;

  @override
  void onInit() async {
    super.onInit();
    _initRepos();
    _getSelectedOfferListType();
    await getOffers();
  }

  void _initRepos() {
    _offerListRepoImpl = OfferListRepoImpl(
      OfferListRemoteDataSourceImpl(_apiService),
    );
  }

  void _getSelectedOfferListType() {
    offerListType(Get.arguments['offerListType']);
  }

  _getUseCase() {
    switch (offerListType.value) {
      case OfferListType.mostPopular:
        return GetOffersMostPopularUseCase(_offerListRepoImpl);
      case OfferListType.nearby:
        return GetOffersNearbyUseCase(_offerListRepoImpl);
      case OfferListType.latest:
        return GetOffersLatestUseCase(_offerListRepoImpl);
    }
  }

  Future<dynamic> _ImplUseCase() async {
    final useCase = _getUseCase();

    return await useCase.execute(
      // offerListType.value,
      search: searchQuery.value.trim(),
      offerCategory: offersFiltersController.selectedOfferCategories.value,
      category: offersFiltersController.selectedCategories.value,
      storeSlug: offersFiltersController.selectedStores.value,
      // price: offersFiltersController.priceRange.value,
      // priceBefore: priceBefore.value,
      // startDate: startDate.value,
      // endDate: endDate.value,
      // discount: offersFiltersController.discountMin.value,
      // ordering: sortBy.value,
      // latitude: latitudeParam.value,
      // longitude: longitudeParam.value,
      // index: index,
      // size: size,
    );
  }

  Future<void> getOffers() async {
    offersIsLoading(true);
    final result = await _ImplUseCase();
    if (result == null) return;

    result.fold(
      (failure) {
        Get.snackbar("error", failure.message);
      },
      (success) {
        offers.assignAll(success);
      },
    );
    offersIsLoading(false);
  }

  @override
  void dispose() {
    offersFiltersController.dispose();
    super.dispose();
  }
}
