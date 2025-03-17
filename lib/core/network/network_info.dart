import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  final InternetConnection internetConnection;
  final Connectivity connectivity;

  NetworkInfo(this.internetConnection, this.connectivity);

  /// التحقق مما إذا كان هناك اتصال بالإنترنت
  Future<bool> get isConnected async =>
      await internetConnection.hasInternetAccess;

  /// التحقق من نوع الاتصال (WiFi أو بيانات الهاتف أو لا يوجد اتصال)
  Future<String> get connectionType async {
    var connectivityResult = await connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.wifi) {
      return "WiFi";
    } else if (connectivityResult == ConnectivityResult.mobile) {
      return "Mobile Data";
    } else {
      return "No Internet";
    }
  }
}
