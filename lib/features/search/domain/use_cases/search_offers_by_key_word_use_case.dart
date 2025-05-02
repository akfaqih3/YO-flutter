
import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/search/data/offers_response_model.dart';
import 'package:yemen_offers/features/search/data/repos/search_repo_impl.dart';
import 'package:yemen_offers/features/search/domain/entities/offers_response_entity.dart';

class SearchOffersByKeyWordUseCase {
  final SearchRepoImpl _searchRepoImpl;
  SearchOffersByKeyWordUseCase(this._searchRepoImpl);

  Future<Either<Failure, OffersResponseEntity>> execute(String searchKeyword) async {
    return await _searchRepoImpl.searchOffesByKeyword(searchKeyword);
  }
}