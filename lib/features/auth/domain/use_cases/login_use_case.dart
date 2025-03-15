import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/auth/data/repos/login_repo_impl.dart';

import '../entities/login_entity.dart';
import '../repos/login_repo.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> excute(Params email, Params password);
}

class LoginUseCase extends UseCase<LoginEntity, String> {
  final LoginRepo _loginRepo;

  LoginUseCase(this._loginRepo);

  @override
  Future<Either<Failure, LoginEntity>> excute(String email, String password) {
    return _loginRepo.login(email, password);
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