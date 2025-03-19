import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/location_service.dart';
import 'package:yemen_offers/features/auth/data/repos/register_repo_impl.dart';
import 'package:yemen_offers/features/auth/domain/use_cases/register_use_case.dart';

class RegisterController extends GetxController {
  final RegisterRepoImpl registerRepoImpl = Get.find<RegisterRepoImpl>();

  // gender options
  final Map<String, String> genderOptions = {
    'Male': 'male',
    'Female': 'female',
  };

  var name = ''.obs;
  var email = ''.obs;
  var gender = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  @override
  void onInit() {
    super.onInit();
    gender.value = genderOptions.values.first;
  }

  void register() async {
    
    final registerUseCase = RegisterUseCase(registerRepoImpl);
    final result = await registerUseCase.excute(
      name.value,
      email.value,
      gender.value,
      password.value,
      confirmPassword.value,
     
    );
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        Get.snackbar("Success", "تم تسجيل الدخول بنجاح");
        Get.toNamed(
          AppRoutes.confirmAccount,
          parameters: {'email': email.value},
        );
      },
    );
  }
}
