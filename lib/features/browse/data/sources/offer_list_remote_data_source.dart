import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/models/offer_model.dart';

abstract class OfferListRemoteDataSource {
  Future<List<OfferModel>> getOfferList({queryParams = const {}});
  Future<List<OfferModel>> getOffersLatest({queryParams = const {}});
  Future<List<OfferModel>> getOffersMostPopular({queryParams = const {}});
  Future<List<OfferModel>> getOffersNearby({queryParams = const {}});
  Future<List<OfferModel>> getOffersRecommendations({queryParams = const {}});
}

class OfferListRemoteDataSourceImpl implements OfferListRemoteDataSource {
  final ApiService _apiService;

  OfferListRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<OfferModel>> getOfferList({queryParams = const {}}) async {
    final response = await _apiService.get(
      Endpoint.offers,
      queryParams: queryParams,
    );
    return offersModelFromJson(response.data[ApiKeys.results]);
  }

  @override
  Future<List<OfferModel>> getOffersLatest({queryParams = const {}}) async {
    final response = await _apiService.get(
      Endpoint.offersLatest,
      queryParams: queryParams,
    );
    return offersModelFromJson(response.data[ApiKeys.results]);
  }

  @override
  Future<List<OfferModel>> getOffersMostPopular({
    queryParams = const {},
  }) async {
  
    final response = await _apiService.get(
      Endpoint.offersMostPopular,
      queryParams: queryParams,
    );
   
    return offersModelFromJson(response.data[ApiKeys.results]);
  }

  @override
  Future<List<OfferModel>> getOffersNearby({queryParams = const {}}) async {
    final response = await _apiService.get(
      Endpoint.offersNearby,
      queryParams: queryParams,
    );
    return offersModelFromJson(response.data[ApiKeys.results]);
  }

  @override
  Future<List<OfferModel>> getOffersRecommendations({
    queryParams = const {},
  }) async {
    final response = await _apiService.get(
      Endpoint.offersRecommendations,
      queryParams: queryParams,
    );
    return offersModelFromJson(response.data);
  }
}
