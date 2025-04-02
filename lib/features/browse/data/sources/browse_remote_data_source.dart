



import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/models/category_model.dart';

abstract class BrowseRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class BrowseRemoteDataSourceImpl implements BrowseRemoteDataSource {
  final ApiService _apiService;

  BrowseRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiService.get(Endpoint.categories);
    return categoryModelFromJson(response.data);
  }
}