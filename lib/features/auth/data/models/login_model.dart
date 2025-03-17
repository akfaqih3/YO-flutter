import 'package:yemen_offers/core/constants/api_constants.dart';

import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.access, required super.refresh});

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
