import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/auth/data/data_sources/login_local_data_source.dart';
import 'package:yemen_offers/features/auth/data/data_sources/login_remote_data_source.dart';
import 'package:yemen_offers/features/auth/data/repos/login_repo_impl.dart';
import 'package:yemen_offers/features/auth/domain/use_cases/google_login_use_case.dart';
import 'package:yemen_offers/features/auth/domain/use_cases/login_use_case.dart';

class LoginController extends GetxController {
  final LoginRepoImpl loginRepo = Get.find<LoginRepoImpl>();
  late LoginUseCase _loginUseCase;

  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loginUseCase = LoginUseCase(loginRepo);
  }

  void login() async {
    isLoading(true);
    Either result = await _loginUseCase.excute(email.value, password.value);
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        Get.snackbar("Success", "تم تسجيل الدخول بنجاح");
        Get.offAllNamed(AppRoutes.main);
      },
    );
    isLoading(false);
  }

  void googleLogin() async {
    isLoading(true);
    final GoogleLoginUseCase googleLoginUseCase = GoogleLoginUseCase(loginRepo);
    Either result = await googleLoginUseCase.excute();
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        if (right != null) {
          openGoogleLogin(right);
        }
      },
    );
    isLoading(false);
  }

  void openGoogleLogin(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    // if (await canLaunchUrl(Uri.parse(url))) {
    //   await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    // }
  }

  static void logout() async {
    final LoginRepoImpl loginRepoImpl = LoginRepoImpl(
      loginRemoteDataSource: LoginRemoteDataSourceImpl(Get.find<ApiService>()),
      loginLocalDataSource: LoginLocalDataSourceImpl(),
    );
    final result = await LogoutUseCase(loginRepoImpl).excute();
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        Get.snackbar("Success", "تم تسجيل الخروج بنجاح");
      },
    );
    Get.offAllNamed(AppRoutes.login);
  }

  void toRegister() {
    Get.toNamed(AppRoutes.register);
  }
}
