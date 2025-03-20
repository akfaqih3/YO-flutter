import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/core/services/location_service.dart';
import 'package:yemen_offers/core/utils/redirect_urls.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService(), fenix: true);
    Get.put<LocationService>(LocationService(), permanent: true);
    // Get.lazyPut<LinkHandlerService>(() => LinkHandlerService(), fenix: true);
  }
}
