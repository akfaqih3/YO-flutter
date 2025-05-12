import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/sources/browse_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_categories_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_stores_use_case.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/categories_controller.dart';

class StoreListController extends GetxController {
  final BrowseRepoImpl _browseRepoImpl = BrowseRepoImpl(
    BrowseRemoteDataSourceImpl(Get.find<ApiService>()),
  );

  final RxList<CategoryEntity> categories = RxList([]);

  RxList<StoreEntity> stores = RxList([]);

  final RxList<String> selectedCategories = RxList([]);

  @override
  void onInit() async {
    super.onInit();
    await getStores();
    await getCategories();
  }

  Future<void> getStores() async {
    final GetStoresUseCase getStoresUseCase = GetStoresUseCase(_browseRepoImpl);
    final result = await getStoresUseCase.execute(
      categories: selectedCategories.value,
    );
    result.fold(
      (failure) => Get.snackbar("error", failure.message),
      (success) => stores.value = success,
    );
  }

  Future<void> getCategories() async {
    if (Get.find<CategoriesController>().categories.isNotEmpty) {
      categories.value = Get.find<CategoriesController>().categories.value;
      return;
    }
    final GetCategoriesUseCase getCategoriesUseCase = GetCategoriesUseCase(
      _browseRepoImpl,
    );
    final result = await getCategoriesUseCase.execute();
    result.fold(
      (failure) => Get.snackbar("error", failure.message),
      (success) => categories.value = success,
    );
  }

  void selectCategory(CategoryEntity offerCategory) async {
    final List<String> tempSelectedOfferCategories =
        selectedCategories.toList();
    if (tempSelectedOfferCategories.contains(offerCategory.slug)) {
      tempSelectedOfferCategories.remove(offerCategory.slug);
    } else {
      tempSelectedOfferCategories.add(offerCategory.slug);
    }
    selectedCategories.assignAll(tempSelectedOfferCategories);

    await getStores();
  }

  @override
  void onClose() {
    super.onClose();
    stores.clear();
    stores.close();
  }
}
