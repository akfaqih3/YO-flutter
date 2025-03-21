import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/store/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/store/domain/repos/store_repo.dart';

class GetCategoriesUseCase {
  final StoreRepo _storeRepo;
  GetCategoriesUseCase(this._storeRepo);

  Future<Either<Failure, List<CategoryEntity>>> execute() async {
    return await _storeRepo.getCategories();
  }
}
