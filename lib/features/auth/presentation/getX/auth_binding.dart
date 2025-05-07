import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/auth/data/data_sources/login_local_data_source.dart';
import 'package:yemen_offers/features/auth/data/data_sources/login_remote_data_source.dart';
import 'package:yemen_offers/features/auth/data/data_sources/register_remote_data_source.dart';
import 'package:yemen_offers/features/auth/data/repos/login_repo_impl.dart';
import 'package:yemen_offers/features/auth/data/repos/register_repo_impl.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/confirm_reset_password_controller.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/confirmation_account_controller.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/join_as_merchant_controller.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/login_controller.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/register_controller.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/reset_password_controller.dart';

class AuthBinding extends Bindings {
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
    Get.lazyPut<RegisterRepoImpl>(
      () => RegisterRepoImpl(
        loginLocalDataSource: LoginLocalDataSourceImpl(),
        registerRemoteDataSource: RegisterRemoteDataSourceImpl(_apiService),
      ),
      fenix: true,
    );
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
    Get.lazyPut<ConfirmAccountController>(
      () => ConfirmAccountController(),
      fenix: true,
    );

    Get.lazyPut<JoinAsMerchantController>(() => JoinAsMerchantController(), fenix: true);
  }
}
