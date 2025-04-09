import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/sources/browse_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_categories_use_case.dart';

class CategoriesController extends GetxController {
  RxList<CategoryEntity> categories = RxList([]);

  final RxBool isLoading = false.obs;

  final BrowseRepoImpl _browseRepoImpl = BrowseRepoImpl(
    BrowseRemoteDataSourceImpl(Get.find<ApiService>()),
  );

  @override
  void onInit() {
    super.onInit();
  }

  Future<List<CategoryEntity>?> getCategories() async {
    if (categories.isNotEmpty) {
      return categories.value;
    }
    isLoading(true);
    final GetCategoriesUseCase getCategoriesUseCase = GetCategoriesUseCase(
      _browseRepoImpl,
    );
    final result = await getCategoriesUseCase.execute();
    isLoading(false);
    result.fold(
      (failure) {
        Get.snackbar("error", failure.message);
        return [];
      },
      (success) {
        categories.value = success;
        return success;
      },
    );
  }
}
