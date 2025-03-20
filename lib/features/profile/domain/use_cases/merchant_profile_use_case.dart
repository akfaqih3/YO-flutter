import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/profile/domain/entities/merchant_entity.dart';
import 'package:yemen_offers/features/profile/domain/repos/merchant_profile_repo.dart';

class GetMerchantProfileUseCase {
  final MerchantProfileRepo _profileRepo;

  GetMerchantProfileUseCase(this._profileRepo);

  Future<Either<Failure, MerchantEntity>> execute() async {
    return await _profileRepo.getProfile();
  }
}


class UpdateMerchantProfileUseCase {
  final MerchantProfileRepo _profileRepo;

  UpdateMerchantProfileUseCase(this._profileRepo);

  Future<Either<Failure, MerchantEntity>> execute(MerchantEntity profile) async {
    return await _profileRepo.updateProfile(profile);
  }
}