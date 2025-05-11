import 'dart:io';

import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/models/offer_model.dart';
import 'package:yemen_offers/features/search/data/offers_response_model.dart';
import 'package:dio/dio.dart' as dio;

abstract class SearchRemoteDataSource {
  Future<OffersResponseModel> searchOffersByKeyword(
    Map<String, dynamic> queryParams,
  );
  Future<OffersResponseModel> searchOffersByImage(dio.FormData params);
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
  Future<OffersResponseModel> searchOffersByImage(dio.FormData params) async {
    final response = await _apiService.post(
      Endpoint.offerSearchByImage,
      data: params,
    );
    return OffersResponseModel.fromJson(response.data);
  }
}
