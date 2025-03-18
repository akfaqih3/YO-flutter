import 'package:yemen_offers/core/cache/cache_helper.dart';
import 'package:yemen_offers/core/constants/cache_constants.dart';
import 'package:yemen_offers/features/auth/data/models/login_model.dart';
import 'package:yemen_offers/features/auth/domain/entities/login_entity.dart';

abstract class LoginLocalDataSource {
  Future<void> saveToken(LoginModel token);
  Future<LoginModel> getToken();
  Future<String?> getRefreshToken();
  Future<String?> getAccessToken();
  Future<void> clearToken();
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  @override
  Future<void> saveToken(LoginModel token) async {
    await CacheHelper.saveData(CacheKeys.refreshToken, token.refresh);
    await CacheHelper.saveData(CacheKeys.accessToken, token.access);
  }

  @override
  Future<LoginModel> getToken() async {
    String? refresh = await CacheHelper.getData(CacheKeys.refreshToken);
    String? access = await CacheHelper.getData(CacheKeys.accessToken);
    return LoginModel(access: access, refresh: refresh);
  }

  @override
  Future<void> clearToken() async {
    await CacheHelper.removeData(CacheKeys.refreshToken);
    await CacheHelper.removeData(CacheKeys.accessToken);
  }

  @override
  Future<String?> getAccessToken() async {
    return await CacheHelper.getData(CacheKeys.accessToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await CacheHelper.getData(CacheKeys.refreshToken);
  }
}
