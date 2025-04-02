import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/auth/presentation/getX/binding.dart';
import 'package:yemen_offers/features/auth/presentation/pages/confirm_account_page.dart';
import 'package:yemen_offers/features/auth/presentation/pages/confirm_reset_password_page.dart';
import 'package:yemen_offers/features/auth/presentation/pages/login_page.dart';
import 'package:yemen_offers/features/auth/presentation/pages/register_page.dart';
import 'package:yemen_offers/features/auth/presentation/pages/reset_password_page.dart';
import 'package:yemen_offers/features/home/presentation/getX/home_binding.dart';
import 'package:yemen_offers/features/home/presentation/views/pages/home_page.dart';
import 'package:yemen_offers/features/home/presentation/views/pages/main_page.dart';
import 'package:yemen_offers/features/favorite/presentation/getX/favorite_binding.dart';
import 'package:yemen_offers/features/favorite/presentation/views/pages/favorite_page.dart';
import 'package:yemen_offers/features/home/presentation/pages/home_page.dart';
import 'package:yemen_offers/features/offer/presentation/getX/offer_binding.dart';
import 'package:yemen_offers/features/offer/presentation/views/pages/merchant_add_update_offer_page.dart';
import 'package:yemen_offers/features/offer/presentation/views/pages/merchant_offer_details_page.dart';
import 'package:yemen_offers/features/profile/presentation/getX/profile_binding.dart';
import 'package:yemen_offers/features/profile/presentation/pages/user_profile_page.dart';
import 'package:yemen_offers/features/store/presentation/getX/store_binding.dart';
import 'package:yemen_offers/features/store/presentation/pages/merchant_add_store_page.dart';
import 'package:yemen_offers/features/store/presentation/pages/merchant_store_details_page.dart';
import 'package:yemen_offers/features/store/presentation/pages/merchant_stores_page.dart';

class AppPages {
  static final String initialRoute = AppRoutes.main;

  static List<GetPage> routes = [
    GetPage(name: AppRoutes.main, page: () => MainPage(), binding: HomeBinding()),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: LoginBinding(),
    ),
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

    // merchant store
    GetPage(
      name: AppRoutes.merchantStores,
      page: () => MerchantStoresPage(),
      binding: StoreBinding(),
    ),
    GetPage(
      name: AppRoutes.merchantAddStore,
      page: () => MerchantAddStorePage(),
    ),
    GetPage(
      name: AppRoutes.merchantStoreDetails,
      page: () => MerchantStoreDetailsPage(),
      binding: OfferBinding(),
    ),

    // merchant offer
    GetPage(
      name: AppRoutes.merchantAddUpdateOffer,
      page: () => MerchantAddUpdateOfferPage(),
    ),
    GetPage(
      name: AppRoutes.merchantOfferDetails,
      page: () => MerchantOfferDetailsPage(),
    ),

    // consumer
    GetPage(
      name: AppRoutes.favorites,
      page: () => FavoritePage(),
      binding: FavoriteBinding(),
    ),
  ];
}
