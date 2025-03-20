import 'package:yemen_offers/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../entities/merchant_entity.dart';

abstract class MerchantProfileRepo {
  Future<Either<Failure, MerchantEntity>> getProfile();
  Future<Either<Failure, MerchantEntity>> updateProfile(MerchantEntity profile);
}
