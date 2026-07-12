import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/store/data/repos/store_repo_impl.dart';
import 'package:yemen_offers/features/store/data/sources/store_remote_data_source.dart';
import 'package:yemen_offers/features/store/domain/entities/merchant_store_etity.dart';
import 'package:yemen_offers/features/store/domain/use_cases/delete_store_use_case.dart';
import 'package:yemen_offers/features/store/domain/use_cases/get_store_use_case.dart';

class MerchantStoresController extends GetxController {
  final ApiService apiService = Get.find<ApiService>();
  late StoreRepoImpl _storeRepoImpl;

  RxList<MerchantStoreEtity> stores = RxList<MerchantStoreEtity>();

  RxBool isStoresLoading = false.obs;

  @override
  void onInit() async {
    initRepoImpl();
    super.onInit();
    getStores();
  }

  void initRepoImpl() {
    _storeRepoImpl = StoreRepoImpl(
      StoreRemoteDataSourceImpl(apiService),
    );
  }

  void getStores() async {
    isStoresLoading(true);
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
    isStoresLoading(false);
  }

  void deleteStore(String slug) async {
    isStoresLoading(true);
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
    isStoresLoading(false);
  }

  void updateStore(MerchantStoreEtity store) async {
    isStoresLoading(true);
    Get.toNamed(AppRoutes.merchantAddStore, arguments: store);
    isStoresLoading(false);
  }
}
