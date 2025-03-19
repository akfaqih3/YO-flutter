import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/auth/data/models/login_model.dart';
import '../models/register_model.dart';

abstract class RegisterRemoteDataSource {
  Future<RegisterModel> register(
    String name,
    String email,
    String gender,
    String password,
    String confirmPassword,
    double latitude,
    double longitude,
  );
  Future<LoginModel> confirmOtpEmail(String email, String otp);
  Future<void> resendOtpEmail(String email);
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final ApiService _apiService;

  RegisterRemoteDataSourceImpl(this._apiService);

  @override
  Future<RegisterModel> register(
    String name,
    String email,
    String gender,
    String password,
    String confirmPassword,
    double latitude,
    double longitude,
  ) async {
    final response = await _apiService.post(Endpoint.register, {
      ApiKeys.name: name,
      ApiKeys.email: email,
      ApiKeys.gender: gender,
      ApiKeys.password: password,
      ApiKeys.confirmPassword: confirmPassword,
      ApiKeys.latitude: latitude,
      ApiKeys.longitude: longitude,
    });
    return RegisterModel.fromJson(response.data['user']);
  }

  @override
  Future<LoginModel> confirmOtpEmail(String email, String otp) async {
    final response = await _apiService.post(Endpoint.confirmOtpEmail, {
      ApiKeys.email: email,
      ApiKeys.otp: otp,
    });
    return LoginModel.fromJson(response.data);
  }

  @override
  Future<void> resendOtpEmail(String email) async {
    await _apiService.post(Endpoint.resendOtpEmail, {ApiKeys.email: email});
  }
}
