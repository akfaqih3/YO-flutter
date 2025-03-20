import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/profile/domain/entities/user_entity.dart';
import 'package:yemen_offers/features/profile/domain/repos/user_profile_repo.dart';

class GetUserProfileUseCase {
  final UserProfileRepo _profileRepo;

  GetUserProfileUseCase(this._profileRepo);

  Future<Either<Failure, UserEntity>> execute() async {
    return await _profileRepo.getProfile();
  }
}

class UpdateUserProfileUseCase {
  final UserProfileRepo _profileRepo;

  UpdateUserProfileUseCase(this._profileRepo);

  Future<Either<Failure, UserEntity>> execute(UserEntity profile) async {
    return await _profileRepo.updateProfile(profile);
  }
}

class ChangePasswordUseCase {
  final UserProfileRepo _profileRepo;

  ChangePasswordUseCase(this._profileRepo);

  Future<Either<Failure, void>> execute(String oldPassword, String newPassword, String confirmPassword) async {
    return await _profileRepo.changePassword(oldPassword, newPassword, confirmPassword);
  }
}
