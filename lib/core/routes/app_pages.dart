import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/auth/presentation/getX/binding.dart';
import 'package:yemen_offers/features/auth/presentation/pages/confirm_account_page.dart';
import 'package:yemen_offers/features/auth/presentation/pages/confirm_reset_password_page.dart';
import 'package:yemen_offers/features/auth/presentation/pages/login_page.dart';
import 'package:yemen_offers/features/auth/presentation/pages/register_page.dart';
import 'package:yemen_offers/features/auth/presentation/pages/reset_password_page.dart';
import 'package:yemen_offers/features/home/presentation/pages/home_page.dart';
import 'package:yemen_offers/features/profile/presentation/getX/profile_binding.dart';
import 'package:yemen_offers/features/profile/presentation/pages/user_profile_page.dart';

class AppPages {
  static final String initialRoute = AppRoutes.home;

  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(name: AppRoutes.home, page: () => HomePage(), binding: LoginBinding()),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => ResetPasswordPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.confirmResetPassword,
      page: () => ConfirmResetPasswordPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.confirmAccount,
      page: () => ConfirmAccountPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.userProfile,
      page: () => UserProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}
