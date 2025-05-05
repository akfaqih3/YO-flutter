import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';

import 'package:yemen_offers/features/auth/data/repos/login_repo_impl.dart';
import 'package:yemen_offers/features/auth/domain/use_cases/password_use_case.dart';

class ResetPasswordController extends GetxController {
  final LoginRepoImpl loginRepo = Get.find<LoginRepoImpl>();
  late ResetPasswordUseCase _resetPasswordUseCase;

  final TextEditingController emailController = TextEditingController();

  var email = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _resetPasswordUseCase = ResetPasswordUseCase(loginRepo);
  }

  void resetPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar("Error", "يرجى إدخال البريد الإلكتروني");
      return;
    }
    isLoading(true);
    Either result = await _resetPasswordUseCase.excute(emailController.text);
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        Get.snackbar(
          "Success",
          "تم إرسال رابط إعادة تعيين كلمة المرور الى البريد ${email.value}",
        );
        Get.offAllNamed(AppRoutes.login);
      },
    );
    isLoading(false);
  }
}
