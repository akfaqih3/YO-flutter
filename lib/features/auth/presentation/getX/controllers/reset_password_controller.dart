import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';

import 'package:yemen_offers/features/auth/data/repos/login_repo_impl.dart';
import 'package:yemen_offers/features/auth/domain/use_cases/password_use_case.dart';

class ResetPasswordController extends GetxController {
  final LoginRepoImpl loginRepo = Get.find<LoginRepoImpl>();
  late ResetPasswordUseCase _resetPasswordUseCase;

  var email = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _resetPasswordUseCase = ResetPasswordUseCase(loginRepo);
  }

  void resetPassword() async {
    isLoading(true);
    Either result = await _resetPasswordUseCase.excute(email.value);
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        Get.snackbar(
          "Success",
          "تم إرسال رابط إعادة تعيين كلمة المرور الى البريد ${email.value}",
        );
      },
    );
    isLoading(false);
  }
}
