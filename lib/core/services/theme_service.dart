import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yemen_offers/core/cache/cache_helper.dart';
import 'package:yemen_offers/core/constants/cache_constants.dart';

class ThemeService extends GetxService {

  @override
  void onInit() async {
    super.onInit();
    getMode();
  }

  void getMode() async {
    final bool isDark = await CacheHelper.getData(CacheKeys.isDarkMode) ?? Get.isDarkMode ;
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> toggleMode() async {
    await CacheHelper.saveData(CacheKeys.isDarkMode, !Get.isDarkMode);
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  //  static void setStatusBarTheme(Brightness brightness) {
  //   SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarIconBrightness:
  //           brightness == Brightness.dark ? Brightness.light : Brightness.dark,
  //     ),
  //   );
  // }

}
