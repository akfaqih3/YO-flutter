import 'package:yemen_offers/core/constants/api_constants.dart';


class LoginModel {
  String? access;
  String? refresh;

  LoginModel({this.access, this.refresh});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      access: json[ApiKeys.accessToken],
      refresh: json[ApiKeys.refreshToken],
    );
  }

  Map<String, dynamic> toJson() {
    return {ApiKeys.accessToken: access, ApiKeys.refreshToken: refresh};
  }
}
