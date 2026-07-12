import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationService extends GetxService {
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  @override
  void onInit() async {
    super.onInit();
    await getCurrentLocation();
  }

  /// ✅ التأكد من صلاحيات الموقع والخدمات
  Future<bool> ensurePermissions() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("❌ تم رفض إذن الموقع.");
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("🚫 تم رفض الإذن نهائيًا، لا يمكن طلبه مرة أخرى.");
      return false;
    }

    return true;
  }

  /// ✅ جلب الموقع الحالي عبر GPS أو IP في حال الفشل
  Future<void> getCurrentLocation() async {
    if (!await ensurePermissions()) {
      await getLocationFromIP(); // 🔄 محاولة عبر الإنترنت
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      latitude.value = _roundTo6Decimals(position.latitude);
      longitude.value = _roundTo6Decimals(position.longitude);
      print("📍 الموقع عبر GPS: ${latitude.value}, ${longitude.value}");
    } catch (e) {
      print("⚠️ فشل في جلب الموقع عبر GPS، محاولة عبر IP...");
      await getLocationFromIP();
    }
  }

  /// ✅ جلب الموقع عبر API في حال فشل GPS
  Future<void> getLocationFromIP() async {
    try {
      var response = await Dio().get("http://ip-api.com/json/");
      if (response.statusCode == 200) {
        latitude.value = _roundTo6Decimals(response.data['lat']);
        longitude.value = _roundTo6Decimals(response.data['lon']);
        print("🌍 الموقع عبر IP: ${latitude.value}, ${longitude.value}");
      } else {
        print("❌ فشل في استرداد الموقع عبر IP.");
      }
    } catch (e) {
      print("❌ خطأ أثناء جلب الموقع عبر IP: $e");
    }
  }

  double _roundTo6Decimals(double value) {
    return double.parse(value.toStringAsFixed(6));
  }
}
