import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/services/location_service.dart';
import 'package:yemen_offers/features/profile/data/models/change_password_model.dart';
import 'package:yemen_offers/features/profile/data/models/user_model.dart';
import 'package:yemen_offers/features/profile/data/sources/user_profile_remote_data_source.dart';
import 'package:yemen_offers/features/profile/domain/entities/user_entity.dart';
import 'package:yemen_offers/features/profile/domain/repos/user_profile_repo.dart';

class UserProfileRepoImpl implements UserProfileRepo {
  final UserProfileRemoteDataSource _remoteDataSource;

  UserProfileRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> getProfile() async {
    try {
      final user = await _remoteDataSource.getProfile();
      return Right(user);
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateProfile(
    UserEntity userEntity,
  ) async {
    try {
      final LocationService locationService = Get.find<LocationService>();
      final longitude = locationService.longitude.value;
      final latitude = locationService.latitude.value;
      final UserModel userModel = UserModel(
        email: userEntity.email,
        name: userEntity.name,
        gender: userEntity.gender,
        longitude: longitude.toString(),
        latitude: latitude.toString(),
        userType: userEntity.userType,
      );
      final user = await _remoteDataSource.updateProfile(userModel);
      return Right(user);
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword(
    String oldPassword,
    String newPassword,
    String confirmPassword,
  ) async {
    try {
      final ChangePasswordModel model = ChangePasswordModel(
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      await _remoteDataSource.changePassword(model);
      return right(null);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }
}
