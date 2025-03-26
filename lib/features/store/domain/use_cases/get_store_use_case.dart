import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/store/domain/entities/store_etity.dart';
import 'package:yemen_offers/features/store/domain/repos/store_repo.dart';

class GetStoreUseCase {
  final StoreRepo _storeRepo;
  GetStoreUseCase(this._storeRepo);

  Future<Either<Failure, List<StoreEntity>>> execute() async {
    return await _storeRepo.getStores();
  }
}
