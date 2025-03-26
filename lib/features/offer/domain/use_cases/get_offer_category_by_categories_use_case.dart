import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/offer/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/offer/domain/repos/offer_repo.dart';

class GetOfferCategoryByCategoriesUseCase {
  final OfferRepo _offerRepo;
  GetOfferCategoryByCategoriesUseCase(this._offerRepo);

  Future<Either<Failure, List<OfferCategoryEntity>>> execute(String categorySlug) async {
    return await _offerRepo.getOfferCategoriesByCategory(categorySlug);
  }
} 