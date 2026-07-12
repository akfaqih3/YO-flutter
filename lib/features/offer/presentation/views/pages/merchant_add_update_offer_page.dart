import 'package:flutter/material.dart';
import 'package:get/get.dart%20';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/offer/presentation/getX/controllers/merchant_add_update_offer_controller.dart';
import 'package:yemen_offers/features/offer/presentation/views/widgets/offer_form_widget.dart';

class MerchantAddUpdateOfferPage
    extends GetView<MerchantAddUpdateOfferController> {
  const MerchantAddUpdateOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () =>
              controller.offer.value == null
                  ? Text(btnNewOffer.tr)
                  : Text(btnUpdateOffer.tr),
        ),
      ),
      body: OfferFormWidget(controller: controller),
      // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     controller.offer.value != null
      //         ? controller.updateOffer()
      //         : controller.addOffer();
      //   },
      //   label: SizedBox(
      //     width: MediaQuery.of(context).size.width * 0.4,
      //     child: Text(
      //       controller.offer.value != null ? btnUpdateOffer.tr : btnNewOffer.tr,
      //       textAlign: TextAlign.center,
      //     ),
      //   ),
      //   backgroundColor: AppColors.primary,
      //   foregroundColor: AppColors.white,
      // ),
    );
  }
}
