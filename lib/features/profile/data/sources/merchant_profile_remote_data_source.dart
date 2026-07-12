import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/profile/data/models/merchant_model.dart';

abstract class MerchantProfileRemoteDataSource {
  Future<MerchantModel> getProfile();
  Future<MerchantModel> updateProfile(MerchantModel profile);
}

class MerchantProfileRemoteDataSourceImpl implements MerchantProfileRemoteDataSource {
  final ApiService _apiService;

  MerchantProfileRemoteDataSourceImpl(this._apiService);

  @override
  Future<MerchantModel> getProfile() async {
    final response = await _apiService.get(Endpoint.merchantProfile);
    return MerchantModel.fromJson(response.data[ApiKeys.user]);
  }

  @override
  Future<MerchantModel> updateProfile(MerchantModel profile) async {
    final response = await _apiService.put(
      Endpoint.merchantUpdate,
      data: profile.toJson(),
    );
    return MerchantModel.fromJson(response.data[ApiKeys.user]);
  }
}