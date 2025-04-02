import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/models/offer_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<OfferModel>> getRecommendations();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<OfferModel>> getRecommendations() async {
    final response = await _apiService.get(Endpoint.recommendations);
    return offersModelFromJson(response.data);
  }
}
