import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yemen_offers/core/cache/cache_helper.dart';
import 'package:yemen_offers/core/constants/cache_constants.dart';


class LanguageService extends GetxService {
  static const appLangkey = 'appLang';
  final arKey = 'ar';
  final enKey = 'en';

  // final appLang = GetStorage().read(appLangkey) ?? Get.locale!.languageCode;
  final appLang = CacheHelper.getData(CacheKeys.appLang) ?? Get.locale!.languageCode;

  @override
  void onInit() {
    Get.updateLocale(Locale(appLang));
    super.onInit();
  }

  void changeLanguage(String langKey) async {
    Get.updateLocale(Locale(langKey));
    await CacheHelper.saveData(CacheKeys.appLang, langKey);
  }
}
