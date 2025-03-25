import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/core/services/location_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiService>(ApiService(), permanent: true);
    Get.put<LocationService>(LocationService(), permanent: true);
    // Get.lazyPut<LinkHandlerService>(() => LinkHandlerService(), fenix: true);
  }
}
