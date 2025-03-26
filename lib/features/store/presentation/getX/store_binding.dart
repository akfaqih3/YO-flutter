import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/store/data/repos/store_repo_impl.dart';
import 'package:yemen_offers/features/store/data/sources/store_remote_data_source.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_add_store_controller.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_store_details_controller.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_stores_controller.dart';

class StoreBinding extends Bindings {
  final ApiService _apiService = Get.find<ApiService>();
  @override
  void dependencies() {
    Get.lazyPut<StoreRepoImpl>(
      () => StoreRepoImpl(StoreRemoteDataSourceImpl(_apiService)),
      fenix: true,
    );
    Get.lazyPut<MerchantStoresController>(
      () => MerchantStoresController(),
      fenix: true,
    );
    Get.lazyPut<MerchantAddStoreController>(
      () => MerchantAddStoreController(),
      fenix: true,
    );
    Get.lazyPut<MerchantStoreDetailsController>(
      () => MerchantStoreDetailsController(),
      fenix: true,
    );
  }
}
