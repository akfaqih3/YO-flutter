import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService(), fenix: true);
  }
}
