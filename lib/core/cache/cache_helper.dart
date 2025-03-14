import 'package:hive/hive.dart';
import 'package:yemen_offers/core/constants/storage_keys.dart';

class CacheHelper {
  static final Box _box = Hive.box(CacheKeys.appCache);

  static Future<void> saveData(String key, dynamic value) async {
    await _box.put(key, value);
  }

  static dynamic getData(String key) {
    return _box.get(key);
  }

  static Future<void> removeData(String key) async {
    await _box.delete(key);
  }

  static Future<void> clearCache() async {
    await _box.clear();
  }
}
