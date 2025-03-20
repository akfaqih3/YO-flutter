import 'package:yemen_offers/core/constants/api_constants.dart';

class ChangePasswordModel {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  ChangePasswordModel({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.oldPassword: oldPassword,
      ApiKeys.newPassword: newPassword,
      ApiKeys.confirmPassword: confirmPassword,
    };
  }
}
