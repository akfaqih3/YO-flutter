import 'package:yemen_offers/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';

abstract class UserProfileRepo {
  Future<Either<Failure, UserEntity>> getProfile();
  Future<Either<Failure, UserEntity>> updateProfile(UserEntity profile);
  Future<Either<Failure, void>> changePassword(
    String oldPassword,
    String newPassword,
    String confirmPassword,
  );
}
