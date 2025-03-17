import 'package:yemen_offers/core/cache/cache_helper.dart';
import 'package:yemen_offers/core/constants/cache_constants.dart';
import 'package:yemen_offers/features/auth/domain/entities/login_entity.dart';

abstract class LoginLocalDataSource {
  Future<void> saveToken(LoginEntity token);
  Future<LoginEntity?>getToken();
  Future<String?> getRefreshToken();
  Future<String?> getAccessToken();
  Future<void> clearToken();
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  @override
  Future<void> saveToken(LoginEntity token) async {
    await CacheHelper.saveData(CacheKeys.refreshToken, token.refresh);
    await CacheHelper.saveData(CacheKeys.accessToken, token.access);
  }

  @override
  Future<LoginEntity?> getToken() async {
    String refresh = await CacheHelper.getData(CacheKeys.refreshToken);
    String access = await CacheHelper.getData(CacheKeys.accessToken);
    return LoginEntity(access: access, refresh: refresh);
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
