import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemen_offers/core/common/presentation/widgets/build_category_dropdown.dart';
import 'package:yemen_offers/core/common/presentation/widgets/custom_image_picker_field.dart';
import 'package:yemen_offers/core/common/presentation/widgets/custom_text_field.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/core/utils/validators.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/join_as_merchant_controller.dart';

class JoinAsMerchantPage extends GetView<JoinAsMerchantController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lblJoinAsMerchant.tr)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lblMerchantData.tr),
                CustomTextField(
                  controller: controller.phoneController,
                  placeholder: hntPhone.tr,
                  prefixIcon: Iconsax.call,
                  validator: validatephoneNumber,
                ),
                CustomTextField(
                  controller: controller.addressController,
                  placeholder: hntAddress.tr,
                  prefixIcon: Icons.location_on_outlined,
                ),
                Text(lblStoreData.tr),

                CustomTextField(
                  controller: controller.storeNameController,
                  placeholder: hntStoreName.tr,
                  prefixIcon: Icons.store,
                  validator: validateName,
                ),
                CustomTextField(
                  controller: controller.storePhoneController,
                  placeholder: hntPhone.tr,
                  prefixIcon: Iconsax.call,
                  validator: validatephoneNumber,
                ),
                CustomTextField(
                  controller: controller.storeWebsiteController,
                  placeholder: hntWebsite.tr,
                  prefixIcon: Icons.link,
                  validator: validateUrl,
                ),
                CustomTextField(
                  controller: controller.storeAddressController,
                  placeholder: hntAddress.tr,
                  prefixIcon: Icons.location_on_outlined,
                ),

                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Obx(
                        () => BuildCategoryDropdown(
                          controller: controller,
                          categories: controller.categories.value,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: CustomImagePickerField(
                        controller: controller,
                        height: 80,
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  controller: controller.storeDescriptionController,
                  placeholder: hntStoreDescription.tr,
                  prefixIcon: Icons.description_outlined,
                ),

                CustomTextField(
                  controller: controller.facebookLinkController,
                  placeholder: lblFacebook.tr,
                  prefixIcon: Icons.facebook_outlined,
                  validator: validateFacebookLink,
                ),
                CustomTextField(
                  controller: controller.instagramLinkController,
                  placeholder: lblInstagram.tr,
                  prefixIcon: Iconsax.instagram,
                  validator: validateInstagramLink,
                ),
                CustomTextField(
                  controller: controller.snapchatLinkController,
                  placeholder: lblSnapchat.tr,
                  prefixIcon: Icons.snapchat_rounded,
                  validator: validateSnapchatLink,
                ),

                // SizedBox(
                //   width: double.infinity,
                //   height: 50,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       controller.joinAsMerchant();
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.deepOrange,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(30),
                //       ),
                //     ),
                //     child: Text(
                //       btnSend.tr,
                //       style: TextStyle(color: Colors.white, fontSize: 16),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.joinAsMerchant();
        },
        label: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(btnSend.tr, textAlign: TextAlign.center),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
