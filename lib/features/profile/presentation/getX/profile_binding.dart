import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/profile/data/repos/merchant_profile_repo_empl.dart';
import 'package:yemen_offers/features/profile/data/repos/user_profile_repo_empl.dart';
import 'package:yemen_offers/features/profile/data/sources/merchant_profile_remote_data_source.dart';
import 'package:yemen_offers/features/profile/data/sources/user_profile_remote_data_source.dart';
import 'package:yemen_offers/features/profile/presentation/getX/controllers/user_profile_controller.dart';
import 'package:yemen_offers/features/profile/presentation/getX/controllers/merchant_profile_controller.dart';

class ProfileBinding extends Bindings {
  final ApiService _apiService = Get.find<ApiService>();

  @override
  void dependencies() {
    Get.lazyPut<UserProfileRepoImpl>(
      () => UserProfileRepoImpl(UserProfileRemoteDataSourceImpl(_apiService)),
    );
    Get.lazyPut<MerchantProfileRepoImpl>(
      () => MerchantProfileRepoImpl(
        MerchantProfileRemoteDataSourceImpl(_apiService),
      ),
    );
    Get.lazyPut<UserProfileController>(() => UserProfileController());
    Get.lazyPut<MerchantProfileController>(() => MerchantProfileController());
  }
}
