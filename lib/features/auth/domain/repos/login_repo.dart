import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';

import '../entities/login_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginEntity>> login(String email, String password);
  Future<Either<Failure, void>> refreshToken();
  Future<Either<Failure, void>> logout();
}
