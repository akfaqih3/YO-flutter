import 'package:get/get.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/categories_controller.dart';

class BrowseBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<BrowseController>(
    //   () => BrowseController(),
    // );
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
    );
  }
}
