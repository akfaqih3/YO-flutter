import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import '../models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> login(String email, String password);
  Future<LoginModel> refreshToken(String refresh);
  Future<void> logout(String refresh);
  Future<void> resetPassword(String email);
  Future<void> confirmResetPassword(String password, String token);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiService _apiService;

  LoginRemoteDataSourceImpl(this._apiService);

  @override
  Future<LoginModel> login(String email, String password) async {
    final response = await _apiService.post(Endpoint.login, {
      ApiKeys.email: email,
      ApiKeys.password: password,
    });
    return LoginModel.fromJson(response.data);
  }

  @override
  Future<LoginModel> refreshToken(String refresh) async {
    final response = await _apiService.post(Endpoint.refresh, {
      ApiKeys.refreshToken: refresh,
    });
    return LoginModel.fromJson(response.data);
  }

  @override
  Future<void> logout(String refresh) async {
    await _apiService.post(Endpoint.logout, {ApiKeys.refreshToken: refresh});
  }

  @override
  Future<void> resetPassword(String email) async {
    await _apiService.post(Endpoint.resetPassword, {ApiKeys.email: email});
  }

  @override
  Future<void> confirmResetPassword(String password, String token) async {
    await _apiService.post(Endpoint.confirmResetPassword, {
      ApiKeys.password: password,
      ApiKeys.token: token,
    });
  }
}
