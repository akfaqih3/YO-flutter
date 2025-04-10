import 'dart:io';

import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/models/offer_model.dart';


abstract class SearchRemoteDataSource {
  Future<List<OfferModel>> searchOffersByKeyword(String searchKeyword);
  Future<List<OfferModel>> searchOffersByImage(File image);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiService _apiService;

  SearchRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<OfferModel>> searchOffersByKeyword(String searchKeyword) async {
    final response = await _apiService.get(
      Endpoint.searchOffersByKeyword,
      queryParams: {
        ApiKeys.searchKeyword: searchKeyword,
      },
    );
    return offersModelFromJson(response.data);
  }

  @override
  Future<List<OfferModel>> searchOffersByImage(File image) async {
    final response = await _apiService.post(
      Endpoint.searchOffersByImage,
      data: image,
    );
    return offersModelFromJson(response.data);
  }
}