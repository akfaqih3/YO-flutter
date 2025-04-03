import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/sources/browse_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';

class BrowseController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  late BrowseRepoImpl _browseRepoImpl;

  RxList<CategoryEntity> categories = RxList([]);

  @override
  void onInit() {
    _browseRepoImpl = BrowseRepoImpl(BrowseRemoteDataSourceImpl(_apiService));
    super.onInit();
  }

  Future<List<CategoryEntity>?> getCategories() async {
    if (categories.isNotEmpty) {
      return categories.value;
    }
    final result = await _browseRepoImpl.getCategories();
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
