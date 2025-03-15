class ApiConstants {
  static const String baseUrl = "https://api.yemenoffers.com";

  // نقاط النهاية (Endpoints)
  static const String login = "/accounts/login";
  static const String refresh = "/accounts/refresh";
  static const String logout = "/accounts/logout";
  static const String register = "/auth/register";
  static const String getOffers = "/offers";
  static const String getCategories = "/categories";

  // مفاتيح API إذا لزم الأمر
  static const String apiKey = "YOUR_SECRET_API_KEY";
}

class ApiKeys {
  static const String accessToken = "access";
  static const String refreshToken = "refresh";

  static const String loginEmail = "email";
  static const String loginPassword = "password";
}
