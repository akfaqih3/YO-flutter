import 'package:get/get.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/categories_controller.dart';

class BrowseBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
    );
  }
}
