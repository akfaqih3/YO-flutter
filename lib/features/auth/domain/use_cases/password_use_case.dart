import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/auth/domain/repos/login_repo.dart';

class ResetPasswordUseCase {
  final LoginRepo _loginRepo;

  ResetPasswordUseCase(this._loginRepo);

  Future<Either<Failure, void>> excute(String email) async {
    return await _loginRepo.resetPassword(email);
  }
}

class ConfirmResetPassword {
  final LoginRepo _loginRepo;

  ConfirmResetPassword(this._loginRepo);

  Future<Either<Failure, void>> excute(String password, String token) async {
    return await _loginRepo.confirmResetPassword(password, token);
  }
}
