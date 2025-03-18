import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';

import '../entities/login_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, bool>> login(String email, String password);
  Future<Either<Failure, void>> refreshToken();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> resetPassword(String email);
  Future<Either<Failure, void>> confirmResetPassword(
    String password,
    String token,
  );
}
