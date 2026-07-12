import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/store/domain/repos/store_repo.dart';

class DeleteStoreUseCase {
  final StoreRepo _storeRepo;
  DeleteStoreUseCase(this._storeRepo);

  Future<Either<Failure, void>> execute(String slug) async {
    return await _storeRepo.deleteStore(slug);
  }
}
