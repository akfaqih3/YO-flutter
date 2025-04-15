import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/auth/data/data_sources/login_local_data_source.dart';
import 'package:yemen_offers/features/auth/data/models/login_model.dart';
import 'package:yemen_offers/core/services/fcm_token_services.dart';

import '../../domain/repos/login_repo.dart';
import '../data_sources/login_remote_data_source.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;
  final LoginLocalDataSource loginLocalDataSource;

  LoginRepoImpl({
    required this.loginRemoteDataSource,
    required this.loginLocalDataSource,
  });

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    try {
      final loginModel = await loginRemoteDataSource.login(email, password);
      await loginLocalDataSource.saveToken(loginModel);
      await FcmTokenServices.sendFCMTokenToServer();
      return right(true);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      LoginModel token = await loginLocalDataSource.getToken();
      if (token.refresh == null) {
        return right(null);
      }
      await loginRemoteDataSource.logout(token.refresh!);
      await FcmTokenServices.deleteFCMTokenFromServer();
      await loginLocalDataSource.clearToken();
      return right(null);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> refreshToken() async {
    try {
      String? refresh = await loginLocalDataSource.getRefreshToken();
      if (refresh != null) {
        final loginEntity = await loginRemoteDataSource.refreshToken(refresh);
        await loginLocalDataSource.saveToken(loginEntity);
      }
      return right(null);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await loginRemoteDataSource.resetPassword(email);
      return right(null);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> confirmResetPassword(
    String password,
    String token,
  ) async {
    try {
      await loginRemoteDataSource.confirmResetPassword(password, token);
      return right(null);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }
}
