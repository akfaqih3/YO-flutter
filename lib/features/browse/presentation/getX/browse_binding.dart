import 'package:get/get.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/categories_controller.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/nearby_offers_controller.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/offer_details_controller.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/offer_list_controller.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/store_details_controller.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/store_list_nearby_controller.dart';

class BrowseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrowseController>(() => BrowseController(), fenix: true);
    Get.lazyPut<OfferListController>(() => OfferListController(), fenix: true);
    Get.lazyPut<CategoriesController>(() => CategoriesController());
    Get.lazyPut<OfferDetailsController>(
      () => OfferDetailsController(),
      fenix: true,
    );
    Get.lazyPut<NearbyOffersController>(
      () => NearbyOffersController(),
      fenix: true,
    );
    Get.lazyPut<StoreDetailsController>(
      () => StoreDetailsController(),
      fenix: true,
    );
    Get.lazyPut<StoreListNearbyController>(
      () => StoreListNearbyController(),
      fenix: true,
    );
  }
}
