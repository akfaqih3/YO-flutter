import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/sources/browse_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_categories_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offer_categories_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_stores_use_case.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/categories_controller.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/offer_list_controller.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/home_controller.dart';

class OffersFiltersController extends GetxController {
  final BrowseRepoImpl _browseRepoImpl = BrowseRepoImpl(
    BrowseRemoteDataSourceImpl(Get.find<ApiService>()),
  );
  final CategoriesController categoriesController =
      Get.find<CategoriesController>();
  final HomeController homeController = Get.find<HomeController>();
  // final OfferListController _offerListController =
  //     Get.find<OfferListController>();

  final RxList<String> selectedCategories = RxList<String>();
  final RxList<String> selectedStores = RxList<String>();
  final RxList<String> selectedOfferCategories = RxList<String>();

  final Rx<List<MultiSelectItem<String>>> categories =
      Rx<List<MultiSelectItem<String>>>([]);

  final Rx<List<MultiSelectItem<String>>> stores =
      Rx<List<MultiSelectItem<String>>>([]);

  final Rx<List<MultiSelectItem<String>>> offerCategories =
      Rx<List<MultiSelectItem<String>>>([]);

  final RxBool categoriesIsLoading = true.obs;
  final RxBool storesIsLoading = true.obs;

  final RxBool offerCategoriesIsLoading = true.obs;

  final isRTL = Get.locale?.languageCode == 'ar';

  final Rx<RangeValues> priceRange = RangeValues(0, 1000).obs;
  final Rx<RangeValues> endDateRange = RangeValues(0, 30).obs;
  final RxDouble discountMin = 0.0.obs;
  final Rxn<DateTime> endBeforeDate = Rxn<DateTime>();

  @override
  void onInit() {
    super.onInit();
    initFiltersData();
  }

  Future<void> initFiltersData() async {
    await getCategories();
    await getStores();
    await getOfferCategories();
  }

  void selectCategories(List<String> categories) {
    selectedCategories.assignAll(categories);
    getStores();
    getOfferCategories();
  }

  Future<void> getCategories() async {
    if (categoriesController.categories.value.isEmpty) {
      categoriesController.getCategories();
    }
    setCategories(categoriesController.categories.value);
  }

  Future<void> getStores() async {
    if (homeController.stores.value.isEmpty) {
      homeController.getStores();
    }
    setStores(homeController.stores.value);
  }

  Future<void> getOfferCategories() async {
    offerCategoriesIsLoading(true);
    final GetOfferCategoriesUseCase getOfferCategoriesUseCase =
        GetOfferCategoriesUseCase(_browseRepoImpl);
    final result = await getOfferCategoriesUseCase.execute();

    result.fold(
      (failure) {
        Get.snackbar("error", failure.message);
      },
      (success) {
        setOfferCategories(success);
      },
    );
    offerCategoriesIsLoading(false);
  }

  void setCategories(List<CategoryEntity> categoryEntities) {
    if (categoryEntities.isNotEmpty) {
      categories(
        categoryEntities
            .map(
              (category) => MultiSelectItem(
                category.slug,
                isRTL ? category.nameAr : category.name,
              ),
            )
            .toList(),
      );
    }
  }

  void setStores(List<StoreEntity> storeEntities) {
    if (storeEntities.isNotEmpty) {
      if (selectedCategories.value.isNotEmpty) {
        storeEntities =
            storeEntities.where((store) {
              return selectedCategories.value.any(
                (category) => store.category.slug == category,
              );
            }).toList();
      }

      stores(
        storeEntities
            .map((store) => MultiSelectItem(store.slug, store.name))
            .toList(),
      );
    }
  }

  void setOfferCategories(List<OfferCategoryEntity> offerCategoryEntities) {
    if (offerCategoryEntities.isNotEmpty) {
      // if (selectedCategories.value.isNotEmpty) {
      //   offerCategoryEntities =
      //       offerCategoryEntities.where((offerCategory) {
      //         return selectedCategories.value.any(
      //           (category) => offerCategory.slug == category,
      //         );
      //       }).toList();
      // }

      offerCategories(
        offerCategoryEntities
            .map(
              (offerCategory) => MultiSelectItem(
                offerCategory.slug,
                isRTL ? offerCategory.nameAr : offerCategory.name,
              ),
            )
            .toList(),
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
