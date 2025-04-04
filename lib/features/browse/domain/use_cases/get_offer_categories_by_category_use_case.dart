import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';

class GetOfferCategoriesByCategoryUseCase {
  final BrowseRepoImpl _browseRepoImpl;
  GetOfferCategoriesByCategoryUseCase(this._browseRepoImpl);

  Future<Either<Failure, List<OfferCategoryEntity>>> execute(
    String categorySlug,
  ) async {
    return await _browseRepoImpl.getOfferCategoriesByCategory(categorySlug);
  }
}