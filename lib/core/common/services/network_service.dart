import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

enum ConnectionStatus { wifi, mobile, none }

class NetworkService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  final InternetConnection _internetChecker = InternetConnection();

  var isConnected = false.obs;
  var connectionStatus = ConnectionStatus.none.obs;

  @override
  void onInit() {
    super.onInit();
    _checkConnection(); // فحص أولي
    _connectivity.onConnectivityChanged.listen((result) {
      _updateConnectionStatus(result);
    });
  }

  Future<void> _checkConnection() async {
    var result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) async {
      
    switch (result[0]) {
      case ConnectivityResult.wifi:
        connectionStatus.value = ConnectionStatus.wifi;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = ConnectionStatus.mobile;
        break;
      default:
        connectionStatus.value = ConnectionStatus.none;
    }

    // التحقق من الوصول الفعلي للإنترنت
    isConnected.value = await _internetChecker.hasInternetAccess;
  }
}
