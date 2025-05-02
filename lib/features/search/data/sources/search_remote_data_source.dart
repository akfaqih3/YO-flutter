import 'dart:io';

import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/models/offer_model.dart';
import 'package:yemen_offers/features/search/data/offers_response_model.dart';

abstract class SearchRemoteDataSource {
  Future<OffersResponseModel> searchOffersByKeyword( Map<String, dynamic> queryParams);
  Future<List<OfferModel>> searchOffersByImage(File image);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiService _apiService;

  SearchRemoteDataSourceImpl(this._apiService);

  @override
  Future<OffersResponseModel> searchOffersByKeyword(
    Map<String, dynamic> queryParams,
  ) async {
    final response = await _apiService.get(
      Endpoint.offerSearchByVector,
      queryParams: queryParams,
    );
    
    return OffersResponseModel.fromJson(response.data);
  }

  @override
  Future<List<OfferModel>> searchOffersByImage(File image) async {
    final response = await _apiService.post(
      Endpoint.offerSearchByImage,
      data: image,
    );
    return offersModelFromJson(response.data);
  }
}
