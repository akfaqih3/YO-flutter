import 'package:hive_flutter/hive_flutter.dart';
import 'package:yemen_offers/core/constants/cache_constants.dart';

class HiveConfig {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(CacheKeys.appCache);
  }
}
