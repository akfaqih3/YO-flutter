import 'package:get/get.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';
import 'package:yemen_offers/features/favorite/presentation/getX/controllers/favorite_controller.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/home_controller.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/main_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<BrowseController>(() => BrowseController(), fenix: true);
    Get.lazyPut<FavoriteController>(() => FavoriteController(), fenix: true);
    Get.put(HomeController());
  }
}
