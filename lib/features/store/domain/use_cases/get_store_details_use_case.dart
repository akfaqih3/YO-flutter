import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/store/domain/entities/merchant_store_etity.dart';
import 'package:yemen_offers/features/store/domain/repos/store_repo.dart';

class GetStoreDetailsUseCase {
  final StoreRepo _storeRepo;
  GetStoreDetailsUseCase(this._storeRepo);

  Future<Either<Failure, MerchantStoreEtity>> execute(String slug) async {
    return await _storeRepo.getStoreDetails(slug);
  }
}