import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/store/data/models/category_model.dart';
import 'package:yemen_offers/features/store/data/models/store_model.dart';
import 'package:dio/dio.dart' as dio;

abstract class StoreRemoteDataSource {
  Future<List<StoreModel>> getStores();
  Future<StoreModel> getStoreDetails(String slug);
  Future<List<CategoryModel>> getCategories();
  Future<void> addStore(Map<String, dynamic> storeData);
  Future<void> updateStore(String slug, Map<String, dynamic> storeData);
  Future<void> deleteStore(String slug);
}

class StoreRemoteDataSourceImpl implements StoreRemoteDataSource {
  final ApiService _apiService;

  StoreRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<StoreModel>> getStores() async {
    final response = await _apiService.get(Endpoint.merchantStores);
    return storeModelFromJson(response.data);
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiService.get(Endpoint.categories);
    return categoryModelFromJson(response.data);
  }

  @override
  Future<void> addStore(storeData) async {
    if (storeData[ApiKeys.storeImage] != null) {
      storeData[ApiKeys.storeImage] = dio.MultipartFile.fromFileSync(
        storeData[ApiKeys.storeImage]!.path,
        filename: storeData[ApiKeys.storeImage]!.path.split('/').last,
      );
    }

    final dio.FormData formData = dio.FormData.fromMap(storeData);
    await _apiService.post(Endpoint.merchantStores, data: formData);
  }

  @override
  Future<void> updateStore(slug, storeData) async {
    if (storeData[ApiKeys.storeImage] != null) {
      storeData[ApiKeys.storeImage] = dio.MultipartFile.fromFileSync(
        storeData[ApiKeys.storeImage]!.path,
        filename: storeData[ApiKeys.storeImage].path.split('/').last,
      );
    }
    final dio.FormData formData = dio.FormData.fromMap(storeData);
    final String url = "${Endpoint.merchantStores}$slug/";

    await _apiService.put(url, data: formData);
  }

  @override
  Future<void> deleteStore(slug) async {
    final String url = "${Endpoint.merchantStores}$slug/";
    await _apiService.delete(url);
  }

  @override
  Future<StoreModel> getStoreDetails(String slug) async {
    final String url = "${Endpoint.merchantStores}$slug/";
    final response = await _apiService.get(url);
    return StoreModel.fromJson(response.data);
  }
}
