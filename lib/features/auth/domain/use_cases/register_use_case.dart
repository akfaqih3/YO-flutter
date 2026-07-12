import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';

import '../repos/register_repo.dart';

class RegisterUseCase {
  final RegisterRepo _registerRepo;
  RegisterUseCase(this._registerRepo);

  Future<Either<Failure, bool>> excute(
    String name,
    String email,
    String gender,
    String password,
    String confirmPassword,
  ) async {
    return await _registerRepo.register(
      name,
      email,
      gender,
      password,
      confirmPassword,
    );
  }
}

class ConfirmOtpEmailUseCase {
  final RegisterRepo _registerRepo;
  ConfirmOtpEmailUseCase(this._registerRepo);
  Future<Either<Failure, void>> excute(String email, String otp) async {
    return await _registerRepo.confirmOtpEmail(email, otp);
  }
}

class ResendOtpEmailUseCase {
  final RegisterRepo _registerRepo;
  ResendOtpEmailUseCase(this._registerRepo);
  Future<Either<Failure, void>> excute(String email) async {
    return await _registerRepo.resendOtpEmail(email);
  }
}
