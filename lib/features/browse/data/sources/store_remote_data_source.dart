import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/models/store_model.dart';

abstract class StoreRemoteDataSource {
  // Future<StoreModel> getStoreDetails(String storeSlug);
  Future<List<StoreModel>> fetchStoreNearby({
    required double latitude,
    required double longitude,
    required double radius,
  });
}

class StoreRemoteDataSourceImpl implements StoreRemoteDataSource {
  final ApiService _apiService;

  StoreRemoteDataSourceImpl(this._apiService);

  // @override
  // Future<StoreModel> getStoreDetails(String storeSlug) async {
  //   return await _apiService.getStoreDetails(storeSlug);
  // }

  @override
  Future<List<StoreModel>> fetchStoreNearby({
    required double latitude,
    required double longitude,
    required double radius,
  }) async {
    final response = await _apiService.get(
      Endpoint.stores,
      queryParams: {
        ApiKeys.latitudeParam: latitude,
        ApiKeys.longitudeParam: longitude,
        ApiKeys.radiusParam: radius,
      },
    );
    return storesModelFromJson(response.data[ApiKeys.results]);
  }
}
