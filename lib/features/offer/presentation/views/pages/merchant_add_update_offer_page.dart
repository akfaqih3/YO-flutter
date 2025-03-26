import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:yemen_offers/features/offer/presentation/getX/controllers/merchant_add_update_offer_controller.dart';
import 'package:yemen_offers/features/offer/presentation/views/widgets/offer_form_widget.dart';

class MerchantAddUpdateOfferPage
    extends GetView<MerchantAddUpdateOfferController> {
  const MerchantAddUpdateOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final offer = controller.offer.value;
    return Scaffold(
      appBar: AppBar(
        title: Text(offer == null ? "إضافة عرض جديد" : "تعديل العرض"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: OfferFormWidget(controller: controller),
        ),
      ),
    );
  }
}
