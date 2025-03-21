class ApiConst {
  static const String domain = "http://192.168.0.40:8000";
  static const String baseUrl = "$domain/api/";
  static const int connectTimeout = 5000;
  static const int receiveTimeout = 5000;

  static const String accountsApp = "accounts";
  static const String merchantApp = "merchants";
  static const String coreApp = "core";
}

class Endpoint {
  static const String login = "token/";
  static const String refresh = "refresh/";
  static const String logout = "${ApiConst.accountsApp}/logout/";
  static const String resetPassword = "password_reset/";
  static const String confirmResetPassword = "password_reset/confirm/";
  static const String register = "${ApiConst.accountsApp}/user/register/";
  static const String confirmOtpEmail = "${ApiConst.accountsApp}/verify-otp/";
  static const String resendOtpEmail = "${ApiConst.accountsApp}/send-otp/";

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

  // core
  static const String categories = "${ApiConst.coreApp}/categories/";
}

class ApiKeys {
  static const String user = "user";
  static const String merchant = "merchant";

  static const String accessToken = "access";
  static const String refreshToken = "refresh";
  static const String token = "token";

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
}
