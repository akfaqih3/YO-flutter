import 'package:get/get.dart';
import 'package:yemen_offers/features/offer/data/repos/offer_repo_impl.dart';
import 'package:yemen_offers/features/offer/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/offer/domain/use_cases/merchant_get_offer_details_use_case.dart';

class MerchantOfferDetailsController extends GetxController {
  final OfferRepoImpl _offerRepoImpl = Get.find<OfferRepoImpl>();

  Rx<OfferEntity?> offer = Rx<OfferEntity?>(null);
  Rx<String> storeSlug = Rx<String>("");

  @override
  void onInit() async {
    super.onInit();
    offer(Get.arguments['offer']);
    storeSlug(Get.arguments['storeSlug']);
    getOfferDetails();
  }

  void getOfferDetails() async {
    if (offer.value == null || storeSlug.value.isEmpty) {
      Get.snackbar("خطاء", "لم تقم بإختيار عرض أو متجر");
      return;
    }
    final MerchantGetOfferDetailsUseCase merchantGetOfferDetailsUseCase =
        MerchantGetOfferDetailsUseCase(_offerRepoImpl);
    final result = await merchantGetOfferDetailsUseCase.execute(
      storeSlug.value,
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
}
