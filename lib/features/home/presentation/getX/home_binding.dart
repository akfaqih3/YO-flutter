import 'package:get/get.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/categories_controller.dart';
import 'package:yemen_offers/features/favorite/presentation/getX/controllers/favorite_controller.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/home_controller.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/main_controller.dart';
import 'package:yemen_offers/features/notification/presentation/getX/controllers/notification_controller.dart';
import 'package:yemen_offers/features/profile/presentation/getX/controllers/user_profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
      fenix: true,
    );
    Get.lazyPut<FavoriteController>(() => FavoriteController(), fenix: true);
    Get.lazyPut<UserProfileController>(
      () => UserProfileController(),
      fenix: true,
    );
    Get.lazyPut<NotificationController>(
      () => NotificationController(),
      fenix: true,
    );
    Get.put(HomeController());
  }
}
