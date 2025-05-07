import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemen_offers/core/common/presentation/widgets/build_category_dropdown.dart';
import 'package:yemen_offers/core/common/presentation/widgets/custom_image_picker_field.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/join_as_merchant_controller.dart';
import 'package:yemen_offers/features/auth/presentation/pages/register_merchant_page.dart';

class JoinAsMerchantPage extends GetView<JoinAsMerchantController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lblJoinAsMerchant.tr)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Merchant data"),
                CustomTextField(
                  controller: controller.phoneController,
                  placeholder: hntPhone.tr,
                ),
                CustomTextField(
                  controller: controller.addressController,
                  placeholder: hntAddress.tr,
                ),
                SizedBox(height: 8),
                Text("Store data"),
                Obx(
                  () => BuildCategoryDropdown(
                    controller: controller,
                    categories: controller.categories.value,
                  ),
                ),
                CustomTextField(
                  controller: controller.storeNameController,
                  placeholder: hntStoreName.tr,
                ),
                CustomTextField(
                  controller: controller.storePhoneController,
                  placeholder: hntPhone.tr,
                ),
                CustomTextField(
                  controller: controller.storeWebsiteController,
                  placeholder: hntWebsite.tr,
                ),
                CustomTextField(
                  controller: controller.storeAddressController,
                  placeholder: hntAddress.tr,
                ),
                CustomImagePickerField(controller: controller),
                CustomTextField(
                  controller: controller.storeDescriptionController,
                  placeholder: hntStoreDescription.tr,
                ),

                CustomTextField(
                  controller: controller.facebookLinkController,
                  placeholder: "facebook url",
                ),
                CustomTextField(
                  controller: controller.instagramLinkController,
                  placeholder: "instgram url",
                ),
                CustomTextField(
                  controller: controller.snapchatLinkController,
                  placeholder: "snap chat url",
                ),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.joinAsMerchant();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'إرسال',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
