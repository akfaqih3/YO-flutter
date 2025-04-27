import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/core/services/location_service.dart';
import 'package:yemen_offers/core/services/theme_service.dart';
import 'package:yemen_offers/features/onboarding/presentation/getX/controllers/onboarding_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiService>(ApiService(), permanent: true);
    // Get.put<LanguageService>(LanguageService(), permanent: true);
    Get.put<ThemeService>(ThemeService(), permanent: true);
    Get.put<LocationService>(LocationService(), permanent: true);
    Get.lazyPut<OnboardingController>(() => OnboardingController());
    // Get.lazyPut<LinkHandlerService>(() => LinkHandlerService(), fenix: true);
  }
}
