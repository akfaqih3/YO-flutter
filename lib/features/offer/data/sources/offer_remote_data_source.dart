import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/offer/data/models/offer_model.dart';
import 'package:yemen_offers/features/offer/data/models/offer_category_model.dart';
import 'package:dio/dio.dart' as dio;

abstract class OfferRemoteDataSource {
  Future<List<OfferModel>> getOffersByStore(String storeSlug);
  Future<OfferModel> getOfferDetails(String storeSlug, String slug);
  Future<List<OfferCategoryModel>> getOfferCategoriesByCategory(
    String categorySlug,
  );
  Future<void> addOffer(
    String storeSlug, {
    required Map<String, dynamic> offerData,
  });
  Future<void> updateOffer(
    String storeSlug,
    String slug, {
    required Map<String, dynamic> offerData,
  });
  Future<void> deleteOffer(String storeSlug, String slug);
}

class OfferRemoteDataSourceImpl implements OfferRemoteDataSource {
  final ApiService _apiService;

  OfferRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<OfferCategoryModel>> getOfferCategoriesByCategory(
    String categorySlug,
  ) async {
    final response = await _apiService.get(
      Endpoint.offerCategoryByCategory(categorySlug),
    );
    return offerCategoryModelFromJson(response.data);
  }

  @override
  Future<List<OfferModel>> getOffersByStore(String storeSlug) async {
    final response = await _apiService.get(Endpoint.merchantOffers(storeSlug));
    return offerModelFromJson(response.data);
  }

  @override
  Future<void> addOffer(
    String storeSlug, {
    required Map<String, dynamic> offerData,
  }) async {
    if (offerData[ApiKeys.offerImage] != null) {
      offerData[ApiKeys.offerImage] = dio.MultipartFile.fromFileSync(
        offerData[ApiKeys.offerImage]!.path,
        filename: offerData[ApiKeys.offerImage]!.path.split('/').last,
      );
    }

    final dio.FormData formData = dio.FormData.fromMap(offerData);
    await _apiService.post(Endpoint.merchantOffers(storeSlug), data: formData);
  }

  @override
  Future<void> updateOffer(
    String storeSlug,
    String slug, {
    required Map<String, dynamic> offerData,
  }) async {
    if (offerData[ApiKeys.offerImage] != null) {
      offerData[ApiKeys.offerImage] = dio.MultipartFile.fromFileSync(
        offerData[ApiKeys.offerImage]!.path,
        filename: offerData[ApiKeys.offerImage]!.path.split('/').last,
      );
    }
    final dio.FormData formData = dio.FormData.fromMap(offerData);
    await _apiService.put(
      Endpoint.merchantOfferCRUD(storeSlug, slug),
      data: formData,
    );
  }

  @override
  Future<void> deleteOffer(String storeSlug, String slug) async {
    await _apiService.delete(Endpoint.merchantOfferCRUD(storeSlug, slug));
  }

  @override
  Future<OfferModel> getOfferDetails(String storeSlug, String slug) async {
    final response = await _apiService.get(
      Endpoint.merchantOfferCRUD(storeSlug, slug),
    );
    return OfferModel.fromJson(response.data);
  }
}
