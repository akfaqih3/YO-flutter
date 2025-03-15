import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/auth/data/data_sources/login_local_data_source.dart';

import '../../domain/entities/login_entity.dart';
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
  Future<Either<Failure, LoginEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final loginEntity = await loginRemoteDataSource.login(email, password);
      await loginLocalDataSource.saveToken(loginEntity);
      return right(loginEntity);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      LoginEntity? token = await loginLocalDataSource.getToken();
      await loginRemoteDataSource.logout(token!.refresh);
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
}
