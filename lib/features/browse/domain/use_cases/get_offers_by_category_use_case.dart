import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';

class GetOffersByCategoryUseCase {
  final BrowseRepoImpl _browseRepoImpl;
  GetOffersByCategoryUseCase(this._browseRepoImpl);

  Future<Either<Failure, List<OfferEntity>>> execute(
    String categorySlug,{
      List<String>? offerCategories ,
      String sortBy = 'end_date',
      String searchQuery = '',
      int index = 0,
      int size = 10,
    }
  ) async {
    return await _browseRepoImpl.getOffersByCategory(
      categorySlug,
      offerCategories: offerCategories,
      sortBy: sortBy,
      searchQuery: searchQuery,
      index: index,
      size: size,
    );
  }
}