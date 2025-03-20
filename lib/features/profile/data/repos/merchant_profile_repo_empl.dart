import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:yemen_offers/features/profile/data/models/merchant_model.dart';
import 'package:yemen_offers/features/profile/data/sources/merchant_profile_remote_data_source.dart';
import 'package:yemen_offers/features/profile/domain/entities/merchant_entity.dart';
import 'package:yemen_offers/features/profile/domain/repos/merchant_profile_repo.dart';

class MerchantProfileRepoImpl implements MerchantProfileRepo {
  final MerchantProfileRemoteDataSource _remoteDataSource;

  MerchantProfileRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, MerchantEntity>> getProfile() async {
    try {
      final merchant = await _remoteDataSource.getProfile();
      return Right(merchant);
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, MerchantEntity>> updateProfile(
    MerchantEntity merchantEntity,
  ) async {
    try {
      final MerchantModel merchantModel = MerchantModel(
        email: merchantEntity.email,
        name: merchantEntity.name,
        gender: merchantEntity.gender,
        longitude: merchantEntity.longitude,
        latitude: merchantEntity.latitude,
        userType: merchantEntity.userType,
        merchantInfo: MerchantInfoModel(
          merchantEntity.phone,
          merchantEntity.idCommercial,
          merchantEntity.address,
        ),
      );
      final merchant = await _remoteDataSource.updateProfile(merchantModel);
      return Right(merchant);
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }
}