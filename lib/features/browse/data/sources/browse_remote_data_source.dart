import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/models/category_model.dart';
import 'package:yemen_offers/features/browse/data/models/offer_category_model.dart';
import 'package:yemen_offers/features/browse/data/models/offer_model.dart';
import 'package:yemen_offers/features/browse/data/models/store_model.dart';

abstract class BrowseRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<OfferCategoryModel>> getOfferCategories();
  Future<List<OfferCategoryModel>> getOfferCategoriesByCategory(
    String categorySlug,
  );
  Future<List<StoreModel>> getStores();
  Future<List<StoreModel>> getStoresByCategory(String categorySlug);
  Future<List<OfferModel>> getOffers();
  Future<List<OfferModel>> getOffersByCategory(String categorySlug);
  Future<List<OfferModel>> getOffersByStore(String storeSlug);
  Future<List<OfferModel>> getOffersByOfferCategory(String offerCategorySlug);
  Future<OfferModel> getOfferDetails(String offerSlug);
}

class BrowseRemoteDataSourceImpl implements BrowseRemoteDataSource {
  final ApiService _apiService;

  BrowseRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiService.get(Endpoint.categories);
    return categoriesModelFromJson(response.data);
  }

  @override
  Future<List<OfferCategoryModel>> getOfferCategories() async {
    final response = await _apiService.get(Endpoint.offerCategories);
    return offerCategoriesModelFromJson(response.data);
  }

  @override
  Future<List<OfferCategoryModel>> getOfferCategoriesByCategory(
    String categorySlug,
  ) async {
    final response = await _apiService.get(
      Endpoint.offerCategoryByCategory(categorySlug),
    );
    return offerCategoriesModelFromJson(response.data);
  }

  @override
  Future<List<StoreModel>> getStores() async {
    final response = await _apiService.get(Endpoint.stores);
    return storesModelFromJson(response.data);
  }

  @override
  Future<List<StoreModel>> getStoresByCategory(String categorySlug) async {
    final response = await _apiService.get(
      Endpoint.storeByCategory(categorySlug),
    );
    return storesModelFromJson(response.data);
  }

  @override
  Future<List<OfferModel>> getOffers() async {
    final response = await _apiService.get(Endpoint.offers);
    return offersModelFromJson(response.data);
  }

  @override
  Future<List<OfferModel>> getOffersByCategory(String categorySlug) async {
    final response = await _apiService.get(
      Endpoint.offerByCategory(categorySlug),
    );
    return offersModelFromJson(response.data);
  }

  @override
  Future<List<OfferModel>> getOffersByStore(String storeSlug) async {
    final response = await _apiService.get(Endpoint.offerByStore(storeSlug));
    return offersModelFromJson(response.data);
  }

  @override
  Future<List<OfferModel>> getOffersByOfferCategory(
    String offerCategorySlug,
  ) async {
    final response = await _apiService.get(
      Endpoint.offerByOfferCategory(offerCategorySlug),
    );
    return offersModelFromJson(response.data);
  }

  @override
  Future<OfferModel> getOfferDetails(String offerSlug) async {
    final response = await _apiService.get(Endpoint.offerDetails(offerSlug));
    return OfferModel.fromJson(response.data);
  }
}
