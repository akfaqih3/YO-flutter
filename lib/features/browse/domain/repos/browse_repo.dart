import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';

abstract class BrowseRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<OfferCategoryEntity>>> getOfferCategories();
  Future<Either<Failure, List<OfferCategoryEntity>>>
  getOfferCategoriesByCategory(String categorySlug);
  Future<Either<Failure, List<StoreEntity>>> getStores();
  Future<Either<Failure, List<StoreEntity>>> getStoresByCategory(
    String categorySlug,
  );

  Future<Either<Failure, List<OfferEntity>>> getOffers();
  Future<Either<Failure, List<OfferEntity>>> getOffersByCategory(
    String categorySlug,{
      List<String>? offerCategories ,
      String sortBy = 'end_date',
      String searchQuery = '',
      int index = 0,
      int size = 10,
    }
  );
  Future<Either<Failure, List<OfferEntity>>> getOffersByStore(String storeSlug);
  Future<Either<Failure, List<OfferEntity>>> getOffersByOfferCategory(
    String offerCategorySlug,
  );

  Future<Either<Failure, OfferEntity>> getOfferDetails(String offerSlug);
}
