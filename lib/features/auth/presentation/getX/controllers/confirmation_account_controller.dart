import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/cache/cache_helper.dart';
import 'package:yemen_offers/core/constants/cache_constants.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/auth/data/repos/register_repo_impl.dart';
import 'package:yemen_offers/features/auth/domain/use_cases/register_use_case.dart';

class ConfirmAccountController extends GetxController {
  final RegisterRepoImpl registerRepoImpl = Get.find<RegisterRepoImpl>();

  final TextEditingController otpController = TextEditingController();

  var email = ''.obs;
  final isloading = false.obs;
  final isResendOtpEmailLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    email(CacheHelper.getData(CacheKeys.emailNotConfirmed));
    _getOtp();
  }

  _getOtp() async {
    final otp = Get.arguments;
    if (otp != null) {
      otpController.text = otp;
      if (email.value.isNotEmpty) {
        confirmAccount();
      }
    }
  }

  Future<void> confirmAccount() async {

    if ( otpController.text.isEmpty) {
      Get.snackbar("Error", "يرجى إدخال رمز التحقق الخاص بك");
      return;
    }
    isloading(true);
   
    final ConfirmOtpEmailUseCase confirmOtpEmailUseCase = ConfirmOtpEmailUseCase(registerRepoImpl);
    final result = await confirmOtpEmailUseCase.excute(email.value, otpController.text);
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        Get.snackbar("Success", "تم تأكيد حساب بنجاح");
        CacheHelper.removeData(CacheKeys.emailNotConfirmed);
        Get.offAllNamed(AppRoutes.main);
      },
    );
    isloading(false);
  }

  Future<void> resendOtpEmail() async {

    if (email.value.isEmpty) {
      return;
    }
    isResendOtpEmailLoading(true);
    final ResendOtpEmailUseCase resendOtpEmailUseCase = ResendOtpEmailUseCase(registerRepoImpl);
    final result = await resendOtpEmailUseCase.excute(email.value);
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        Get.snackbar("Success", "تم إرسال رمز التحقق الخاص بك بنجاح");
      },
    );
    isResendOtpEmailLoading(false);
  }
}