import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/auth/domain/entities/login_entity.dart';
import '../models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> login(String email, String password);
  Future<LoginModel> refreshToken(String refresh);
  Future<void> logout(String refresh);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiService _apiService;

  LoginRemoteDataSourceImpl(this._apiService);

  @override
  Future<LoginModel> login(String email, String password) async {
    final response = await _apiService.post(ApiConst.login, {
      ApiKeys.loginEmail: email,
      ApiKeys.loginPassword: password,
    });
    return LoginModel.fromJson(response.data);
  }

  @override
  Future<LoginModel> refreshToken(String refresh) async {
    final response = await _apiService.post(ApiConst.refresh, {
      ApiKeys.refreshToken: refresh,
    });
    return LoginModel.fromJson(response.data);
  }

  @override
  Future<void> logout(String refresh) async {
    await _apiService.post(ApiConst.logout, {ApiKeys.refreshToken: refresh});
  }
}
