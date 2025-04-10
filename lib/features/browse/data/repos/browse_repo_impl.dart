import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/data/models/category_model.dart';
import 'package:yemen_offers/features/browse/data/models/offer_category_model.dart';
import 'package:yemen_offers/features/browse/data/models/offer_model.dart';
import 'package:yemen_offers/features/browse/data/models/store_model.dart';
import 'package:yemen_offers/features/browse/data/sources/browse_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:yemen_offers/features/browse/domain/repos/browse_repo.dart';

class BrowseRepoImpl implements BrowseRepo {
  final BrowseRemoteDataSource _remoteDataSource;

  BrowseRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final List<CategoryModel> categories =
          await _remoteDataSource.getCategories();
      return Right(categoryEntityFromModel(categories));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, List<OfferCategoryEntity>>>
  getOfferCategories() async {
    try {
      final List<OfferCategoryModel> offerCategories =
          await _remoteDataSource.getOfferCategories();
      return Right(offerCategoryEntityFromModel(offerCategories));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, List<OfferCategoryEntity>>>
  getOfferCategoriesByCategory(String categorySlug) async {
    try {
      final List<OfferCategoryModel> offerCategories = await _remoteDataSource
          .getOfferCategoriesByCategory(categorySlug);
      return Right(offerCategoryEntityFromModel(offerCategories));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, List<StoreEntity>>> getStores() async {
    try {
      final List<StoreModel> stores = await _remoteDataSource.getStores();
      return Right(storeEntityFromModel(stores));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, List<StoreEntity>>> getStoresByCategory(
    String categorySlug,
  ) async {
    try {
      final List<StoreModel> stores = await _remoteDataSource
          .getStoresByCategory(categorySlug);
      return Right(storeEntityFromModel(stores));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> getOffers() async {
    try {
      final List<OfferModel> offers = await _remoteDataSource.getOffers();
      return Right(offerEntityFromModel(offers));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> getOffersByCategory(
    String categorySlug,
  ) async {
    try {
      final List<OfferModel> offers = await _remoteDataSource
          .getOffersByCategory(categorySlug);
      return Right(offerEntityFromModel(offers));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> getOffersByStore(
    String storeSlug,
  ) async {
    try {
      final List<OfferModel> offers = await _remoteDataSource.getOffersByStore(
        storeSlug,
      );
      return Right(offerEntityFromModel(offers));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> getOffersByOfferCategory(
    String offerCategorySlug,
  ) async {
    try {
      final List<OfferModel> offers = await _remoteDataSource
          .getOffersByOfferCategory(offerCategorySlug);
      return Right(offerEntityFromModel(offers));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }
}
