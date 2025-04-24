import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';

class SplashController extends GetxController {
  var opacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    
    Future.delayed(Duration(milliseconds: 500), () {
      opacity.value = 1.0;
    });

    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.main);
    });
  }

}
