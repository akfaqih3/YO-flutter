import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/sources/browse_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offer_categories_by_category_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offer_categories_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offers_by_category_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offers_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_stores_by_category_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_stores_use_case.dart';

class BrowseController extends GetxController with GetSingleTickerProviderStateMixin {
  final ApiService _apiService = Get.find<ApiService>();
  late BrowseRepoImpl _browseRepoImpl;

  final Rx<CategoryEntity?> selectedCategory = Rx(null);
  final RxList<String> selectedOfferCategories = RxList([]);

  final RxList<OfferCategoryEntity> offerCategories = RxList([]);
  final RxList<OfferEntity> offers = RxList([]);
  final RxList<StoreEntity> stores = RxList([]);

  final ScrollController scrollController = ScrollController();
  final RxBool showTabs = true.obs;
  late TabController tabController;
  final selectedTabIndex = 0.obs;

  final sortOptions = ["price", "rating", "distance"];

  // query params
  final RxString sortBy = "price".obs;
  bool isAscending = true;
  String searchQuery = "";
  int index = 0;
  int size = 10;

  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    _initTabController();
    super.onInit();
    _browseRepoImpl = BrowseRepoImpl(BrowseRemoteDataSourceImpl(_apiService));
    _getSelectedCategory();
    await getOfferCategories();
    await getOffers();
    await getStores();

    _listenScrollController();


    
  }

  void _listenScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (showTabs.value) {
          showTabs.value = false;
        }
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!showTabs.value) {
          showTabs.value = true;
        }
      }
    });
  }

  void _initTabController() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        selectedTabIndex.value = tabController.index;
      }
    });
  }

  void _getSelectedCategory() {
    selectedCategory(Get.arguments['category']);
  }

  Future<void> getOfferCategories() async {
    final GetOfferCategoriesByCategoryUseCase getOfferCategoriesByCategoryUseCase = GetOfferCategoriesByCategoryUseCase(_browseRepoImpl);
    final result = await getOfferCategoriesByCategoryUseCase.execute(selectedCategory.value!.slug);

    result.fold(
      (failure) {
        Get.snackbar("error", failure.message);
      },
      (success) {
        offerCategories.value = success;
      },
    );
  }

  void selectOfferCategory(OfferCategoryEntity offerCategory) async {
    final List<String> tempSelectedOfferCategories =
        selectedOfferCategories.toList();
    if (tempSelectedOfferCategories.contains(offerCategory.slug)) {
      tempSelectedOfferCategories.remove(offerCategory.slug);
    } else {
      tempSelectedOfferCategories.add(offerCategory.slug);
    }
    selectedOfferCategories.assignAll(tempSelectedOfferCategories);
    
    await getOffers();
  }

  _getOffersByCategoryUseCase() {
    if (selectedCategory.value == null) {
      return GetOffersUseCase(_browseRepoImpl);
    } else {
      return GetOffersByCategoryUseCase(_browseRepoImpl);
    }
  }

  Future<dynamic> _ImplOffersUseCase() async {
    final useCase = _getOffersByCategoryUseCase();
    if (useCase is GetOffersUseCase) {
      return await useCase.execute();
    } else if (useCase is GetOffersByCategoryUseCase) {
      
      return await useCase.execute(
        selectedCategory.value!.slug,
        offerCategories: selectedOfferCategories.value,
        sortBy: isAscending ? sortBy.value : "-${sortBy.value}",
        searchQuery: searchQuery,
        index: index,
        size: size,
      );
    }
    return null;
  }

  Future<void> getOffers() async {
    isLoading(true);
    final result = await _ImplOffersUseCase();
    if (result == null) return;

    result.fold(
      (failure) {
        Get.snackbar("error", failure.message);
      },
      (success) {
        offers.assignAll(success);
      },
    );
    isLoading(false);
  }

  Future<void> getStores() async {
    final dynamic result;
    if (selectedCategory.value == null) {
      final GetStoresUseCase getStoresUseCase = GetStoresUseCase(
        _browseRepoImpl,
      );
      result = await getStoresUseCase.execute();
    } else {
      final GetStoresByCategoryUseCase getStoresUseCase =
          GetStoresByCategoryUseCase(_browseRepoImpl);
      result = await getStoresUseCase.execute(selectedCategory.value!.slug);
    }
    result.fold(
      (failure) {
        Get.snackbar("error", failure.message);
      },
      (success) {
        stores.value = success;
      },
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }

}
