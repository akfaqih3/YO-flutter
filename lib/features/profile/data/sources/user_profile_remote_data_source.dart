import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/profile/data/models/change_password_model.dart';
import 'package:yemen_offers/features/profile/data/models/user_model.dart';

abstract class UserProfileRemoteDataSource {
  Future<UserModel> getProfile();
  Future<UserModel> updateProfile(UserModel profile);
  Future<void> changePassword(ChangePasswordModel model);
}

class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  final ApiService _apiService;

  UserProfileRemoteDataSourceImpl(this._apiService);

  @override
  Future<UserModel> getProfile() async {
    final response = await _apiService.get(Endpoint.userProfile);
    return UserModel.fromJson(response.data[ApiKeys.user]);
  }

  @override
  Future<UserModel> updateProfile(UserModel profile) async {
    final response = await _apiService.put(
      Endpoint.userUpdate,
      data: profile.toJson(),
    );
    return UserModel.fromJson(response.data[ApiKeys.user]);
  }

  @override
  Future<void> changePassword(model) async {
    await _apiService.put(Endpoint.changePassword, data: model.toJson());
  }
}
