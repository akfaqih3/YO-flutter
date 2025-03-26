import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/offer/data/repos/offer_repo_impl.dart';
import 'package:yemen_offers/features/offer/data/sources/offer_remote_data_source.dart';
import 'package:yemen_offers/features/offer/presentation/getX/controllers/merchant_add_update_offer_controller.dart';
import 'package:yemen_offers/features/offer/presentation/getX/controllers/merchant_offer_details_controller.dart';

class OfferBinding extends Bindings {
  final ApiService _apiService = Get.find<ApiService>();
  @override
  void dependencies() {
    Get.lazyPut<OfferRepoImpl>(
      () => OfferRepoImpl(OfferRemoteDataSourceImpl(_apiService)),
      fenix: true,
    );
    Get.lazyPut<MerchantAddUpdateOfferController>(
      () => MerchantAddUpdateOfferController(),
      fenix: true,
    );
    Get.lazyPut<MerchantOfferDetailsController>(
      () => MerchantOfferDetailsController(),
      fenix: true,
    );
  }
}
