import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/offer/data/repos/offer_repo_impl.dart';
import 'package:yemen_offers/features/offer/domain/entities/merchant_offer_entity.dart';
import 'package:yemen_offers/features/offer/domain/use_cases/merchant_delete_offer_use_case.dart';
import 'package:yemen_offers/features/offer/domain/use_cases/merchant_get_offer_details_use_case.dart';
import 'package:yemen_offers/features/store/domain/entities/merchant_store_etity.dart';

class MerchantOfferDetailsController extends GetxController {
  final OfferRepoImpl _offerRepoImpl = Get.find<OfferRepoImpl>();

  Rx<MerchantOfferEntity?> offer = Rx<MerchantOfferEntity?>(null);
  Rx<MerchantStoreEtity?> store = Rx<MerchantStoreEtity?>(null);

  @override
  void onInit() async {
    super.onInit();
    offer(Get.arguments['offer']);
    store(Get.arguments['store']);
    getOfferDetails();
  }

  void getOfferDetails() async {
    if (offer.value == null || store.value == null) {
      Get.snackbar("خطاء", "لم تقم بإختيار عرض أو متجر");
      return;
    }
    final MerchantGetOfferDetailsUseCase merchantGetOfferDetailsUseCase =
        MerchantGetOfferDetailsUseCase(_offerRepoImpl);
    final result = await merchantGetOfferDetailsUseCase.execute(
      store.value!.slug!,
      offer.value!.slug!,
    );

    result.fold(
      (left) {
        Get.snackbar("خطاء", left.message.toString());
      },
      (right) {
        offer(right);
      },
    );
  }

  void updateOffer() async {
    if (offer.value == null) {
      Get.snackbar("خطاء", "لم تقم بإختيار عرض");
      return;
    }
    Get.toNamed(
      AppRoutes.merchantAddUpdateOffer,
      arguments: {'offer': offer.value, 'store': store.value},
    );
  }

  void deleteOffer() async {
    if (offer.value == null) {
      Get.snackbar("خطاء", "لم تقم بإختيار عرض");
      return;
    }
    final MerchantDeleteOfferUseCase merchantDeleteOfferUseCase =
        MerchantDeleteOfferUseCase(_offerRepoImpl);
    final result = await merchantDeleteOfferUseCase.execute(
      store.value!.slug!,
      offer.value!.slug!,
    );

    result.fold(
      (left) {
        Get.snackbar("خطاء", left.message.toString());
      },
      (right) {
        Get.back();
      },
    );
  }
}
