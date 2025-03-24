import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/store/data/repos/store_repo_impl.dart';
import 'package:yemen_offers/features/store/domain/entities/store_etity.dart';
import 'package:yemen_offers/features/store/domain/use_cases/get_store_details_use_case.dart';
import 'package:url_launcher/url_launcher.dart';

class MerchantStoreDetailsController extends GetxController {
  final StoreRepoImpl _storeRepoImpl = Get.find<StoreRepoImpl>();

  Rx<StoreEntity?> store = Rx<StoreEntity?>(null);

  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    store(Get.arguments);
  }

  void getStoreDetails() async {
    isLoading(true);
    final GetStoreDetailsUseCase getStoreDetailsUseCase =
        GetStoreDetailsUseCase(_storeRepoImpl);
    final result = await getStoreDetailsUseCase.execute(store.value!.slug!);

    result.fold(
      (left) {
        Get.snackbar("خطاء", left.message.toString());
      },
      (right) {
        store(right);
      },
    );
    isLoading(false);
  }
}
