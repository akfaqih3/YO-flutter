import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';

import '../entities/login_entity.dart';
import '../repos/login_repo.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> excute(Params email, Params password);
}

class LoginUseCase extends UseCase<bool, String> {
  final LoginRepo _loginRepo;

  LoginUseCase(this._loginRepo);

  @override
  Future<Either<Failure, bool>> excute(
    String email,
    String password,
  ) async {
    return await _loginRepo.login(email, password);
  }
}

class LogoutUseCase extends UseCase<void, void> {
  final LoginRepo _loginRepo;

  LogoutUseCase(this._loginRepo);

  @override
  Future<Either<Failure, void>> excute([void email, void password]) {
    return _loginRepo.logout();
  }
}
