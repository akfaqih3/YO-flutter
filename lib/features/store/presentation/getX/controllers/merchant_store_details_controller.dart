import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/offer/data/repos/offer_repo_impl.dart';
import 'package:yemen_offers/features/offer/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/offer/domain/use_cases/merchant_get_offers_use_case.dart';
import 'package:yemen_offers/features/store/data/repos/store_repo_impl.dart';
import 'package:yemen_offers/features/store/domain/entities/store_etity.dart';
import 'package:yemen_offers/features/store/domain/use_cases/get_store_details_use_case.dart';

class MerchantStoreDetailsController extends GetxController {
  final StoreRepoImpl _storeRepoImpl = Get.find<StoreRepoImpl>();

  Rx<StoreEntity?> store = Rx<StoreEntity?>(null);
  RxList<OfferEntity> offers = RxList<OfferEntity>();

  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    store(Get.arguments);
    getOffers();
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

  void getOffers() async {
    final OfferRepoImpl _offerRepoImpl = Get.find<OfferRepoImpl>();
    isLoading(true);
    if (store.value == null) {
      Get.snackbar("خطاء", "لم تقم بإختيار متجر");
      return;
    }
    final MerchantGetOffersUseCase merchantGetOffersUseCase =
        MerchantGetOffersUseCase(_offerRepoImpl);
    final result = await merchantGetOffersUseCase.execute(store.value!.slug!);

    result.fold(
      (left) {
        Get.snackbar("خطاء", left.message.toString());
      },
      (right) {
        offers.clear();
        offers.addAll(right);
      },
    );
    isLoading(false);
  }

  void getOfferDetails(OfferEntity offer) async {
    Get.toNamed(
      AppRoutes.merchantOfferDetails,
      arguments: {'offer': offer, 'store': store.value},
    );
  }

  void goToAddOffer() {
    Get.toNamed(
      AppRoutes.merchantAddUpdateOffer,
      arguments: {'store': store.value},
    );
  }
}
