import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/theme/snack_bar_widget.dart';
import 'package:yemen_offers/features/auth/data/repos/login_repo_impl.dart';
import 'package:yemen_offers/features/auth/domain/use_cases/password_use_case.dart';

class ConfirmResetPasswordController extends GetxController {
  final LoginRepoImpl loginRepo = Get.find<LoginRepoImpl>();
  late ConfirmResetPassword _confirmResetPassword;

  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final Rx<String?> token = Rx<String?>(null);
  var isLoading = false.obs;
  final isReady = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    token.value = Get.arguments;
    _confirmResetPassword = ConfirmResetPassword(loginRepo);
  }

  void confirmResetPassword() async {
    if (password.text != confirmPassword.text) {
      showCustomSnackbar("Error", "كلمات المرور غير متطابقة");
      return;
    }

    if (token.value == null) {
      Get.snackbar("Error", "رمز التحقق الخاص بك غير صالح");
      return;
    }
    if (formKey.currentState!.validate()) {
      isLoading(true);
      Either result = await _confirmResetPassword.excute(
        password.text,
        token.value!,
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
    }
    isLoading(false);
  }
}
