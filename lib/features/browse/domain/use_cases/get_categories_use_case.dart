import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';

class GetCategoriesUseCase {
  final BrowseRepoImpl _browseRepoImpl;
  GetCategoriesUseCase(this._browseRepoImpl);

  Future<Either<Failure, List<CategoryEntity>>> execute() async {
    return await _browseRepoImpl.getCategories();
  }
}
