import 'package:get/get.dart';
import 'package:yemen_offers/features/favorite/presentation/getX/controllers/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}
