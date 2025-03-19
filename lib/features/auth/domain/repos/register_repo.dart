import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';

abstract class RegisterRepo {
  Future<Either<Failure, bool>> register(
    String name,
    String email,
    String gender,
    String password,
    String confirmPassword,
  );

  Future<Either<Failure, void>> confirmOtpEmail(String email, String otp);
  Future<Either<Failure, void>> resendOtpEmail(String email);
}
