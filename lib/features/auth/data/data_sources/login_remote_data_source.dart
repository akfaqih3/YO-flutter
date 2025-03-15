import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/auth/domain/entities/login_entity.dart';
import '../models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginEntity> login(String email, String password);
  Future<LoginEntity> refreshToken(String refresh);
  Future<void> logout(String refresh);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiService _apiService;

  LoginRemoteDataSourceImpl(this._apiService);

  @override
  Future<LoginEntity> login(String email, String password) async {
    final response = await _apiService.post(ApiConstants.login, {
      ApiKeys.loginEmail: email,
      ApiKeys.loginPassword: password,
    });
    return LoginModel.fromJson(response.data);
  }

  @override
  Future<LoginEntity> refreshToken(String refresh) async {
    final response = await _apiService.post(ApiConstants.refresh, {
      ApiKeys.refreshToken: refresh,
    });
    return LoginModel.fromJson(response.data);
  }

  @override
  Future<void> logout(String refresh) async {
    await _apiService.post(ApiConstants.logout, {
      ApiKeys.refreshToken: refresh,
    });
  }
}
