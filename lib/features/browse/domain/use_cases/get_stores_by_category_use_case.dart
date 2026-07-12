import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';

class GetStoresByCategoryUseCase {
  final BrowseRepoImpl _browseRepoImpl;
  GetStoresByCategoryUseCase(this._browseRepoImpl);

  Future<Either<Failure, List<StoreEntity>>> execute(
    String categorySlug,
  ) async {
    return await _browseRepoImpl.getStoresByCategory(categorySlug);
  }
}