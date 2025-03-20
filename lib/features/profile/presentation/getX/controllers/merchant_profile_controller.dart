import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/profile/data/repos/merchant_profile_repo_empl.dart';
import 'package:yemen_offers/features/profile/domain/entities/merchant_entity.dart';
import 'package:yemen_offers/features/profile/domain/use_cases/merchant_profile_use_case.dart';

class MerchantProfileController extends GetxController {
  final MerchantProfileRepoImpl _merchantProfileRepo = Get.find<MerchantProfileRepoImpl>();
  MerchantEntity? _merchant;
  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    final GetMerchantProfileUseCase getMerchantProfileUseCase = GetMerchantProfileUseCase(
      _merchantProfileRepo,
    );
    final result = await getMerchantProfileUseCase.execute();
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        _merchant = right;
      },
    );
  }
}