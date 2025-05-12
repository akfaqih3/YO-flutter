import 'package:get/get.dart';
import 'package:yemen_offers/core/common/presentation/no_internet_page.dart';
import 'package:yemen_offers/core/middlewares/main_middleware.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/auth/presentation/getX/auth_binding.dart';
import 'package:yemen_offers/features/auth/presentation/pages/confirm_account_page.dart';
import 'package:yemen_offers/features/auth/presentation/pages/confirm_reset_password_page.dart';
import 'package:yemen_offers/features/auth/presentation/pages/join_as%20merchant_page.dart';
import 'package:yemen_offers/features/auth/presentation/pages/login_page.dart';
import 'package:yemen_offers/features/auth/presentation/pages/register_page.dart';
import 'package:yemen_offers/features/auth/presentation/pages/reset_password_page.dart';
import 'package:yemen_offers/features/browse/presentation/getX/browse_binding.dart';
import 'package:yemen_offers/features/browse/presentation/views/pages/browse_page.dart';
import 'package:yemen_offers/features/browse/presentation/views/pages/categories_page.dart';
import 'package:yemen_offers/features/browse/presentation/views/pages/nearby_offers_page.dart';
import 'package:yemen_offers/features/browse/presentation/views/pages/offer_details_page.dart';
import 'package:yemen_offers/features/browse/presentation/views/pages/offer_list_page.dart';
import 'package:yemen_offers/features/browse/presentation/views/pages/store_details_page.dart';
import 'package:yemen_offers/features/browse/presentation/views/pages/store_list_nearby_page.dart';
import 'package:yemen_offers/features/home/presentation/getX/home_binding.dart';
import 'package:yemen_offers/features/home/presentation/views/pages/home_page.dart';
import 'package:yemen_offers/features/home/presentation/views/pages/main_page.dart';
import 'package:yemen_offers/features/favorite/presentation/views/pages/favorite_page.dart';
import 'package:yemen_offers/features/notification/presentation/getX/notification_binding.dart';
import 'package:yemen_offers/features/notification/presentation/pages/notification_page.dart';
import 'package:yemen_offers/features/offer/presentation/getX/offer_binding.dart';
import 'package:yemen_offers/features/offer/presentation/views/pages/merchant_add_update_offer_page.dart';
import 'package:yemen_offers/features/offer/presentation/views/pages/merchant_offer_details_page.dart';
import 'package:yemen_offers/features/onboarding/presentation/views/pages/onboarding_page.dart';
import 'package:yemen_offers/features/onboarding/presentation/views/pages/splash_page.dart';
import 'package:yemen_offers/features/profile/presentation/getX/profile_binding.dart';
import 'package:yemen_offers/features/profile/presentation/pages/user_profile_page.dart';
import 'package:yemen_offers/features/search/presentation/getX/search_binding.dart';
import 'package:yemen_offers/features/search/presentation/views/pages/search_page.dart';
import 'package:yemen_offers/features/store/presentation/getX/store_binding.dart';
import 'package:yemen_offers/features/store/presentation/pages/merchant_add_store_page.dart';
import 'package:yemen_offers/features/store/presentation/pages/merchant_store_details_page.dart';
import 'package:yemen_offers/features/store/presentation/pages/merchant_stores_page.dart';

class AppPages {
  static final String initialRoute = AppRoutes.splash;

  static List<GetPage> routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashPage()),
    GetPage(
      name: AppRoutes.main,
      page: () => MainPage(),
      binding: HomeBinding(),
      middlewares: [MainMiddleware()],
    ),
    GetPage(name: AppRoutes.onboarding, page: () => OnboardingPage()),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => ResetPasswordPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.confirmResetPassword,
      page: () => ConfirmResetPasswordPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.confirmAccount,
      page: () => ConfirmAccountPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.userProfile,
      page: () => UserProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.joinAsMerchant,
      page: () => JoinAsMerchantPage(),
      binding: AuthBinding(),
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
    GetPage(name: AppRoutes.favorites, page: () => FavoritePage()),

    // browse
    GetPage(
      name: AppRoutes.offerList,
      page: () => OfferListPage(),
      binding: BrowseBinding(),
    ),
    GetPage(
      name: AppRoutes.browse,
      page: () => BrowsePage(),
      binding: BrowseBinding(),
    ),
    GetPage(
      name: AppRoutes.categories,
      page: () => CategoriesPage(),
      binding: BrowseBinding(),
    ),

    // GetPage(
    //   name: AppRoutes.nearbyOffers,
    //   page: () => NearbyOffersPage(),
    //   binding: BrowseBinding(),
    // ),
    GetPage(
      name: AppRoutes.offerDetails,
      page: () => OfferDetailsPage(),
      binding: BrowseBinding(),
    ),
    GetPage(
      name: AppRoutes.storeDetails,
      page: () => StoreDetailsPage(),
      binding: BrowseBinding(),
    ),
    GetPage(
      name: AppRoutes.storeListNearby,
      page: () => StoreListNearbyPage(),
      binding: BrowseBinding(),
    ),

    // search
    GetPage(
      name: AppRoutes.search,
      page: () => SearchPage(),
      binding: SearchBinding(),
    ),

    // notification
    GetPage(
      name: AppRoutes.notifications,
      page: () => NotificationPage(),
      binding: NotificationBinding(),
    ),

    // no internet
    GetPage(name: AppRoutes.noInternet, page: () => NoInternetPage()),
  ];
}
