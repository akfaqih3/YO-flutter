import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/models/offer_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<OfferModel>> getRecommendations({int limit=3});
  Future<List<OfferModel>> getMostPopularOffers();
  Future<List<OfferModel>> getLatestOffers();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<OfferModel>> getRecommendations( {int limit=3}) async {
    final response = await _apiService.get(
      Endpoint.recommendations,
      queryParams: {ApiKeys.limit: limit},
    );
    return offersModelFromJson(response.data);
  }

  @override
  Future<List<OfferModel>> getMostPopularOffers() async {
    final response = await _apiService.get(Endpoint.mostPopularOffers);
    return offersModelFromJson(response.data[ApiKeys.results]);
  }

  @override
  Future<List<OfferModel>> getLatestOffers() async {
    final response = await _apiService.get(Endpoint.latestOffers);
    return offersModelFromJson(response.data[ApiKeys.results]);
  }
}
