import 'package:get/get.dart';
import 'package:yemen_offers/app_home.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/auth/presentation/getX/binding.dart';
import 'package:yemen_offers/features/auth/presentation/pages/login_page.dart';

class AppPages {
  static final String initialRoute = AppRoutes.login;

  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(name: AppRoutes.home, page: () => AppHome()),
  ];
}
