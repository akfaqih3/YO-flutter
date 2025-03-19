import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/auth/data/repos/register_repo_impl.dart';
import 'package:yemen_offers/features/auth/domain/use_cases/register_use_case.dart';

class ConfirmAccountController extends GetxController {
  final RegisterRepoImpl registerRepoImpl = Get.find<RegisterRepoImpl>();

  var email = ''.obs;
  var otp = ''.obs;

  @override
  void onInit() {
    super.onInit();
    email.value = Get.parameters['email'] ?? '';
  }

  void confirmAccount() async {
    if (email.value.isEmpty) {
      return;
    }
    final ConfirmOtpEmailUseCase confirmOtpEmailUseCase = ConfirmOtpEmailUseCase(registerRepoImpl);
    final result = await confirmOtpEmailUseCase.excute(email.value, otp.value);
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        Get.snackbar("Success", "تم تسجيل الدخول بنجاح");
        Get.offAllNamed(AppRoutes.home);
      },
    );
  }

  void resendOtpEmail() async {
    if (email.value.isEmpty) {
      return;
    }
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
  }
}