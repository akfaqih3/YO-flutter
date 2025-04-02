import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/home/domain/entities/recommendations_offer_entity.dart';
abstract class HomeRepo {
  Future<Either<Failure, List<RecommendationsOfferEntity>>> getRecommendations();
}