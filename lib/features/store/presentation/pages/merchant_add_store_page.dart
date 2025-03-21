import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_add_store_controller.dart';
import 'package:yemen_offers/features/store/presentation/widgets/add_store_form_widget.dart';

class MerchantAddStorePage extends GetView<MerchantAddStoreController> {
  const MerchantAddStorePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("اضافة متجر")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return AddStoreFormWidget(controller: controller);
      }),
    );
  }
}
