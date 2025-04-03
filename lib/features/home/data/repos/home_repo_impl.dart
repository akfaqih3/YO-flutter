


import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/data/models/offer_model.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/home/data/sources/home_remote_data_source.dart';
import 'package:yemen_offers/features/home/domain/entities/recommendations_offer_entity.dart';
import 'package:yemen_offers/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<RecommendationsOfferEntity>>> getRecommendations({int limit=3}) async {
    try {
      final List<OfferModel> recommendations = await _remoteDataSource.getRecommendations(limit:limit);
      return Right(recommendationsOffersEntityFromModel(recommendations));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }
  
  @override
  Future<Either<Failure, List<OfferEntity>>> getMostPopularOffers() async {
    try {
      final List<OfferModel> mostPopularOffers = await _remoteDataSource.getMostPopularOffers();
      return Right(offerEntityFromModel(mostPopularOffers));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> getLatestOffers() async {
    try {
      final List<OfferModel> latestOffers = await _remoteDataSource.getLatestOffers();
      return Right(offerEntityFromModel(latestOffers));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }


}