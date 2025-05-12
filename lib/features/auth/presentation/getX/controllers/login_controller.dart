import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
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

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var email = ''.obs;
  var password = ''.obs;

  final isLoginLoading = false.obs;
  final isGoogleLoginLoading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    _loginUseCase = LoginUseCase(loginRepo);
  }

  Future<void> login() async {
    // if (emailController.text.isEmpty || passwordController.text.isEmpty) {
    //   Get.snackbar(
    //     "Error",
    //     "البريد الإلكتروني وكلمة المرور لا يمكن ان تكون فارغة",
    //   );
    //   return;
    // }
    if (formKey.currentState!.validate()) {
      isLoginLoading(true);
      Either result = await _loginUseCase.excute(
        emailController.text,
        passwordController.text,
      );
      result.fold(
        (left) {
          Get.snackbar("Error", left.message);
        },
        (right) {
          Get.snackbar("Success", "تم تسجيل الدخول بنجاح");
          Get.offAllNamed(AppRoutes.splash);
        },
      );
    }
    isLoginLoading(false);
  }

  Future<void> googleLogin() async {
    isGoogleLoginLoading(true);
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
    isGoogleLoginLoading(false);
  }

  static Future<void> openGoogleLogin(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    // if (await canLaunchUrl(Uri.parse(url))) {
    //   await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    // }
  }

  static Future<void> logout() async {
    final LoginRepoImpl loginRepoImpl = LoginRepoImpl(
      loginRemoteDataSource: LoginRemoteDataSourceImpl(Get.find<ApiService>()),
      loginLocalDataSource: LoginLocalDataSourceImpl(),
    );
    final result = await LogoutUseCase(loginRepoImpl).excute();
    result.fold((left) {
      Get.snackbar("Error", left.message);
    }, (right) {});
    Get.offAllNamed(AppRoutes.login);
  }

  void toRegister() {
    Get.toNamed(AppRoutes.register);
  }
}
