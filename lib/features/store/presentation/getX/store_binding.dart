import 'package:get/get.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_add_store_controller.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_store_details_controller.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_stores_controller.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
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
