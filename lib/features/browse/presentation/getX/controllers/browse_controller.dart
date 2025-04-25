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

class BrowseController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  late BrowseRepoImpl _browseRepoImpl;

  final Rx<CategoryEntity?> selectedCategory = Rx(null);
  final RxList<OfferCategoryEntity> selectedOfferCategories = RxList([]);

  final RxList<OfferCategoryEntity> offerCategories = RxList([]);
  final RxList<OfferEntity> offers = RxList([]);
  final RxList<StoreEntity> stores = RxList([]);

  final ScrollController scrollController = ScrollController();
  final RxBool showTabs = true.obs;

  @override
  void onInit() async {
    super.onInit();
    _browseRepoImpl = BrowseRepoImpl(BrowseRemoteDataSourceImpl(_apiService));
    _getSelectedCategory();
    await getOfferCategories();
    await getOffers();
    await getStores();

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

  void _getSelectedCategory() {
    selectedCategory(Get.arguments['category']);
  }

  void selectOfferCategory(OfferCategoryEntity offerCategory) {
    final List<OfferCategoryEntity> tempSelectedOfferCategories =
        selectedOfferCategories.toList();
    if (tempSelectedOfferCategories.contains(offerCategory)) {
      tempSelectedOfferCategories.remove(offerCategory);
    } else {
      tempSelectedOfferCategories.add(offerCategory);
    }
    selectedOfferCategories.assignAll(tempSelectedOfferCategories);
  }

  Future<void> getOfferCategories() async {
    dynamic result;
    if (selectedCategory.value == null) {
      final GetOfferCategoriesUseCase getOfferCategoriesUseCase =
          GetOfferCategoriesUseCase(_browseRepoImpl);
      result = await getOfferCategoriesUseCase.execute();
    } else {
      final GetOfferCategoriesByCategoryUseCase getOfferCategoriesUseCase =
          GetOfferCategoriesByCategoryUseCase(_browseRepoImpl);
      result = await getOfferCategoriesUseCase.execute(
        selectedCategory.value!.slug,
      );
    }

    // final GetOfferCategoriesUseCase getOfferCategoriesUseCase =
    //     GetOfferCategoriesUseCase(_browseRepoImpl);
    // result = await getOfferCategoriesUseCase.execute();

    result.fold(
      (failure) {
        Get.snackbar("error", failure.message);
      },
      (success) {
        offerCategories.value = success;
      },
    );
  }

  Future<void> getOffers() async {
    final result;
    if (selectedCategory.value == null) {
      final GetOffersUseCase getOffersUseCase = GetOffersUseCase(
        _browseRepoImpl,
      );
      result = await getOffersUseCase.execute();
    } else {
      final GetOffersByCategoryUseCase getOffersUseCase =
          GetOffersByCategoryUseCase(_browseRepoImpl);
      result = await getOffersUseCase.execute(selectedCategory.value!.slug);
    }
    result.fold(
      (failure) {
        Get.snackbar("error", failure.message);
      },
      (success) {
        offers.value = success;
      },
    );
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
}
