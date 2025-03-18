import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/auth/data/data_sources/login_local_data_source.dart';
import 'package:yemen_offers/features/auth/data/data_sources/login_remote_data_source.dart';
import 'package:yemen_offers/features/auth/data/repos/login_repo_impl.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/confirm_reset_password_controller.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/login_controller.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/reset_password_controller.dart';

class LoginBinding extends Bindings {
  final ApiService _apiService = Get.find<ApiService>();
  @override
  void dependencies() {
    Get.lazyPut<LoginRepoImpl>(
      () => LoginRepoImpl(
        loginRemoteDataSource: LoginRemoteDataSourceImpl(_apiService),
        loginLocalDataSource: LoginLocalDataSourceImpl(),
      ),
      fenix: true,
    );
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController(),
      fenix: true,
    );
    Get.lazyPut<ConfirmResetPasswordController>(
      () => ConfirmResetPasswordController(),
      fenix: true,
    );
  }
}
