import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/core/services/location_service.dart';
import 'package:yemen_offers/features/auth/data/data_sources/login_local_data_source.dart';
import 'package:yemen_offers/features/auth/data/data_sources/register_remote_data_source.dart';
import 'package:yemen_offers/features/auth/data/models/login_model.dart';

import '../../domain/repos/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final RegisterRemoteDataSource registerRemoteDataSource;
  final LoginLocalDataSource loginLocalDataSource;

  final LocationService locationService = Get.find<LocationService>();

  RegisterRepoImpl({
    required this.loginLocalDataSource,
    required this.registerRemoteDataSource,
  });

  @override
  Future<Either<Failure, bool>> register(
    String name,
    String email,
    String gender,
    String password,
    String confirmPassword,
  ) async {
    try {
      final LocationService locationService = Get.find<LocationService>();
      final double latitude = locationService.latitude.value;
      final double longitude = locationService.longitude.value;

      await registerRemoteDataSource.register(
        name,
        email,
        gender,
        password,
        confirmPassword,
        latitude,
        longitude,
      );
      return right(true);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> confirmOtpEmail(
    String email,
    String otp,
  ) async {
    try {
      final LoginModel loginModel = await registerRemoteDataSource
          .confirmOtpEmail(email, otp);
      await loginLocalDataSource.saveToken(loginModel);
      return right(null);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, void>> resendOtpEmail(String email) async {
    try {
      await registerRemoteDataSource.resendOtpEmail(email);
      return right(null);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }
}
