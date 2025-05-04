class ApiConst {
  // static const String domain = "http://192.168.0.40:8000";
  static const String domain = "http://yemeni-offers.com";
  static const String baseUrl = "$domain/api/";
  static const int connectTimeout = 5000;
  static const int receiveTimeout = 5000;

  static const String accountsApp = "accounts";
  static const String merchantApp = "merchants";
  static const String consumerApp = "consumers";
  static const String coreApp = "core";
  static const String recommendationsApp = "recommendations";
  static const String notificationsApp = "notifications";
}

class Endpoint {
  static const String login = "token/";
  static const String refresh = "refresh/";
  static const String googleLogin = "${ApiConst.accountsApp}/google-login/";
  static const String logout = "${ApiConst.accountsApp}/logout/";
  static const String resetPassword = "password_reset/";
  static const String confirmResetPassword = "password_reset/confirm/";
  static const String register = "${ApiConst.accountsApp}/user/register/";
  static const String confirmOtpEmail = "${ApiConst.accountsApp}/verify-otp/";
  static const String resendOtpEmail = "${ApiConst.accountsApp}/send-otp/";

  static const String fcmToken = "${ApiConst.notificationsApp}/fcm-token/";

  static const String userProfile = "${ApiConst.accountsApp}/user/profile/";
  static const String userUpdate = "${ApiConst.accountsApp}/user/update/";
  static const String merchantProfile =
      "${ApiConst.accountsApp}/merchant/profile/";
  static const String merchantUpdate =
      "${ApiConst.accountsApp}/merchant/update/";
  static const String changePassword =
      "${ApiConst.accountsApp}/change-password/";

  // Merchant store
  static const String merchantStores = "${ApiConst.merchantApp}/stores/";

  // Merchant offer
  static String merchantOffers(String storeSlug) =>
      "${merchantStores}$storeSlug/offers/";
  static String merchantOfferCRUD(String storeSlug, String slug) =>
      "${merchantOffers(storeSlug)}$slug/";

  // consumer favorite
  static String favorites = "${ApiConst.consumerApp}/favorites/";
  static String favoritesDelete(int id) => "$favorites$id/";

  // core
  static const String categories = "${ApiConst.coreApp}/categories/";
  static String offerCategories = "${ApiConst.coreApp}/offer-categories/";
  static String stores = "${ApiConst.coreApp}/stores/";
  static String offers = "${ApiConst.coreApp}/offers/";
  static String offersLatest = "${ApiConst.coreApp}/offers-latest/";
  static String offersMostPopular = "${ApiConst.coreApp}/offers-most-popular/";
  static String offersNearby = "${ApiConst.coreApp}/offers-nearby/";
  static String offerDetails(String offerSlug) => "$offers$offerSlug/";
  static String offerCategoryByCategory(String categorySlug) =>
      "$categories$categorySlug/offer-categories/";
  static String storeByCategory(String categorySlug) =>
      "$categories$categorySlug/stores/";
  static String offerByCategory(String categorySlug) =>
      "$categories$categorySlug/offers/";
  static String offerByStore(String storeSlug) => "$stores$storeSlug/offers/";
  static String offerByOfferCategory(String offerCategorySlug) =>
      "$offerCategories$offerCategorySlug/offers/";
  static String offerSearchByVector =
      "${ApiConst.coreApp}/offers-search/vector/";
  static String offerSearchByImage = "${ApiConst.coreApp}/offers-search/image/";

  static String mostPopularOffers = "${ApiConst.coreApp}/offers-most-popular/";
  static String latestOffers = "${ApiConst.coreApp}/offers-latest/";

  // recommendations
  static String offersRecommendations =
      "${ApiConst.recommendationsApp}/behavior-based/";

  // notifications
  static String notifications = "${ApiConst.notificationsApp}/notifications/";
  static String notificationsOpen(int id) => "$notifications$id/";
}

class ApiKeys {
  static const String user = "user";
  static const String merchant = "merchant";

  static const String results = "results";

  // query params
  static const String categoryParam = "category";
  static const String storeSlugParam = "store_slug";
  static const String offerCategoryParam = "offer_category";
  static const String priceMinParam = "price_min";
  static const String priceMaxParam = "price_max";
  static const String priceBeforeMinParam = "price_before_min";
  static const String priceBeforeMaxParam = "price_before_max";
  static const String startDateMinParam = "start_date_after";
  static const String startDateMaxParam = "start_date_before";
  static const String endDateMinParam = "end_date_after";
  static const String endDateMaxParam = "end_date_before";
  static const String discountParam = "discount";
  static const String orderingParam = "ordering";
  static const String latitudeParam = "latitude";
  static const String longitudeParam = "longitude";
  static const String indexParam = "index";
  static const String sizeParam = "size";
  static const String searchParam = "search";
  static const String searchVectorParam = "vector_search";
  static const String limitParam = "limit";

  static const String limit = "limit";
  static const String index = "index";
  static const String size = "size";
  static const String ordering = "ordering";

  // filters keys
  static const String offerCategories = "offer_category";

  static const String accessToken = "access";
  static const String refreshToken = "refresh";
  static const String token = "token";

  static const String fcmToken = "fcm_token";

  static const String email = "email";
  static const String password = "password";
  static const String confirmPassword = "confirm_password";

  static const String name = "name";
  static const String gender = "gender";
  static const String longitude = "longitude";
  static const String latitude = "latitude";

  static const String otp = "otp";

  static const String oldPassword = "old_password";
  static const String newPassword = "new_password";

  // store keys
  static const String storeSlug = "slug";
  static const String storeName = "name";
  static const String storeDescription = "description";
  static const String storeCategory = "category";
  static const String storeImage = "image";
  static const String storePhone = "phone";
  static const String storeWebsite = "website";
  static const String storeAddress = "address";
  static const String storeLongitude = "longitude";
  static const String storeLatitude = "latitude";
  static const String storeSocialMedia = "social_media";

  // offer keys
  static const String offerSlug = "slug";
  static const String offerTitle = "title";
  static const String offerDescription = "description";
  static const String offerCategory = "category";
  static const String offerImage = "image";
  static const String offerPriceBefore = "price_before";
  static const String offerPriceAfter = "price_after";
  static const String offerStartDate = "start_date";
  static const String offerEndDate = "end_date";
}
