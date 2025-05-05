import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/cache/cache_helper.dart';
import 'package:yemen_offers/core/constants/cache_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/auth/data/data_sources/login_local_data_source.dart';
import 'package:yemen_offers/features/auth/data/data_sources/login_remote_data_source.dart';
import 'package:yemen_offers/features/auth/data/repos/login_repo_impl.dart';
import 'package:yemen_offers/features/auth/data/repos/register_repo_impl.dart';
import 'package:yemen_offers/features/auth/domain/repos/login_repo.dart';
import 'package:yemen_offers/features/auth/domain/use_cases/google_login_use_case.dart';
import 'package:yemen_offers/features/auth/domain/use_cases/register_use_case.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/login_controller.dart';

class RegisterController extends GetxController {
  final RegisterRepoImpl registerRepoImpl = Get.find<RegisterRepoImpl>();

  // gender options
  final Map<String, String> genderOptions = {
    'Male': 'male',
    'Female': 'female',
  };

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  var name = ''.obs;
  var email = ''.obs;
  var gender = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  final isRegisterLoading = false.obs;
  final isGoogleRegisterLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    gender.value = genderOptions.values.first;
  }

  Future<void> register() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        genderController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar("Error", "يرجى ملء الحقول المطلوبة");
      return;
    }
    isRegisterLoading(true);
    final registerUseCase = RegisterUseCase(registerRepoImpl);
    final result = await registerUseCase.excute(
      nameController.text,
      emailController.text,
      genderController.text,
      passwordController.text,
      confirmPasswordController.text,
    );
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        CacheHelper.saveData(CacheKeys.emailNotConfirmed, emailController.text);
        Get.toNamed(
          AppRoutes.confirmAccount,
        );
      },
    );
    isRegisterLoading(false);
  }

  Future<void> RegisterWithGoogle() async {
    isGoogleRegisterLoading(true);
    final GoogleLoginUseCase googleLoginUseCase = GoogleLoginUseCase(
      LoginRepoImpl(
        loginRemoteDataSource: LoginRemoteDataSourceImpl(
          Get.find<ApiService>(),
        ),
        loginLocalDataSource: LoginLocalDataSourceImpl(),
      ),
    );
    final result = await googleLoginUseCase.excute();
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        if (right != null) {
          LoginController.openGoogleLogin(right);
        }
      },
    );
    isGoogleRegisterLoading(true);
  }
}
