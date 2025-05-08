import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:dio/dio.dart' as dio;

abstract class ShareOfferRemoteDataSource {
  Future<void> shareOfferUser(String offerSlug);
}

class ShareOfferRemoteDataSourceImpl implements ShareOfferRemoteDataSource {
  final ApiService _apiService;

  ShareOfferRemoteDataSourceImpl(this._apiService);

  @override
  Future<void> shareOfferUser(String offerSlug) async {
    await _apiService.post(Endpoint.shareOffer(offerSlug));
  }
}
