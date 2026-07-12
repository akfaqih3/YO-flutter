import 'package:get/get.dart';
import 'package:yemen_offers/features/search/presentation/getX/controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchOffersController>(
      () => SearchOffersController(),
      fenix: true,
    );
  }
}
