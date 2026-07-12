import 'package:get/get.dart';

class AppCarouselController extends GetxController {
  final carouselCurrentIndex = 0.obs;

  void updatePageIndicator(int index) {
    carouselCurrentIndex.value = index;
  }
}
