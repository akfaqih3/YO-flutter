class ApiConst {
  static const String domain = "http://192.168.0.40:8000";
  static const String baseUrl = "$domain/api/";
  static const int connectTimeout = 5000;
  static const int receiveTimeout = 5000;

  static const String accountsApp = "accounts";
  static const String offersApp = "offers";
}

class Endpoint {
  static const String login = "token/";
  static const String refresh = "refresh/";
  static const String logout = "${ApiConst.accountsApp}/logout/";
  static const String resetPassword = "password_reset/";
  static const String confirmResetPassword = "password_reset/confirm/";
}

class ApiKeys {
  static const String accessToken = "access";
  static const String refreshToken = "refresh";
  static const String token = "token";

  static const String email = "email";
  static const String password = "password";
}
