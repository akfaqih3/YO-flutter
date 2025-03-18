import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/auth/data/repos/login_repo_impl.dart';
import 'package:yemen_offers/features/auth/domain/use_cases/password_use_case.dart';

class ConfirmResetPasswordController extends GetxController {
  final LoginRepoImpl loginRepo = Get.find<LoginRepoImpl>();
  late ConfirmResetPassword _confirmResetPassword;

  var password = ''.obs;
  var token = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = Get.arguments;
    _confirmResetPassword = ConfirmResetPassword(loginRepo);
  }

  void confirmResetPassword() async {
    isLoading(true);
    Either result = await _confirmResetPassword.excute(
      password.value,
      token.value,
    );
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        Get.snackbar("Success", "تم تأكيد إعادة تعيين كلمة المرور بنجاح");
        Get.offAllNamed(AppRoutes.login);
      },
    );
    isLoading(false);
  }
}
