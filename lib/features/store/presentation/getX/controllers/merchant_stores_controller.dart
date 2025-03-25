import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/store/data/repos/store_repo_impl.dart';
import 'package:yemen_offers/features/store/domain/entities/store_etity.dart';
import 'package:yemen_offers/features/store/domain/use_cases/delete_store_use_case.dart';
import 'package:yemen_offers/features/store/domain/use_cases/get_store_use_case.dart';

class MerchantStoresController extends GetxController {
  final StoreRepoImpl _storeRepoImpl = Get.find<StoreRepoImpl>();

  RxList<StoreEntity> stores = RxList<StoreEntity>();

  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getStores();
  }

  void getStores() async {
    isLoading(true);
    final GetStoreUseCase getStoreUseCase = GetStoreUseCase(_storeRepoImpl);
    final result = await getStoreUseCase.execute();

    result.fold(
      (left) {
        Get.snackbar("خطاء", left.message.toString());
      },
      (right) {
        stores.clear();
        stores.addAll(right);
      },
    );
    isLoading(false);
  }

  void deleteStore(String slug) async {
    isLoading(true);
    final DeleteStoreUseCase deleteStoreUseCase = DeleteStoreUseCase(
      _storeRepoImpl,
    );
    final result = await deleteStoreUseCase.execute(slug);

    result.fold(
      (left) {
        Get.snackbar("خطاء", left.message.toString());
      },
      (right) {
        Get.snackbar("تم حذف المتجر", "المتجر المحذوف بنجاح");
      },
    );
    isLoading(false);
  }

  void updateStore(StoreEntity store) async {
    isLoading(true);
    Get.toNamed(AppRoutes.merchantAddStore, arguments: store);
    isLoading(false);
  }
}
