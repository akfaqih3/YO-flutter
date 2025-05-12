import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemen_offers/core/common/presentation/widgets/build_date_piker_field.dart';
import 'package:yemen_offers/core/common/presentation/widgets/build_offer_categories_dropdown.dart';
import 'package:yemen_offers/core/common/presentation/widgets/custom_text_field.dart';
import 'package:yemen_offers/core/common/presentation/widgets/image_picker_field_widget.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/utils/validators.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/offer/presentation/getX/controllers/merchant_add_update_offer_controller.dart';

class OfferFormWidget extends StatelessWidget {
  final MerchantAddUpdateOfferController controller;

  OfferFormWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImagePickerFieldWidget(
              onTap: () {
                controller.pickImage();
              },
              imagePath: controller.imageFile,
              labelText: hntOfferImage.tr,
              imageHeight: 200,
            ),
            CustomTextField(
              controller: controller.titleController,
              placeholder: hntOfferTitle.tr,
              prefixIcon: Icons.title,
              validator: validateName,
            ),
            CustomTextField(
              controller: controller.descriptionController,
              placeholder: hntOfferDescription.tr,
              prefixIcon: Icons.description,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(
                () =>
                    controller.offerCategories.value.isEmpty
                        ? Container()
                        : BuildOfferCategoriesDropdown(controller: controller),
              ),
            ),
            CustomTextField(
              controller: controller.priceBeforeController,
              placeholder: hntOfferPriceBefore.tr,
              prefixIcon: Icons.attach_money,
              validator: validatePriceBefore,
            ),
            CustomTextField(
              controller: controller.priceAfterController,
              placeholder: hntOfferPriceAfter.tr,
              prefixIcon: Icons.attach_money,
              validator: (value) {
                return validatePriceAfter(
                  value,
                  controller.priceBeforeController,
                );
              },
            ),
            BuildDatePikerField(
              controller: controller.startDateController,
              placeholder: hntOfferStartDate.tr,
              prefixIcon: Iconsax.calendar,
              validator: validateStartDate,
            ),
            BuildDatePikerField(
              controller: controller.endDateController,
              placeholder: hntOfferEndDate.tr,
              prefixIcon: Iconsax.calendar,
              firstDate:
                  controller.startDateController.text.isNotEmpty
                      ? DateTime.parse(controller.startDateController.text)
                      : DateTime.now(),
              validator: (value) {
                return validateEndDate(value, controller.startDateController);
              },
            ),
      
            // CustomTextField(
            //   controller: controller.startDateController,
            //   placeholder: hntOfferStartDate.tr,
            //   prefixIcon: Icons.calendar_today,
            // ),
            // CustomTextField(
            //   controller: controller.endDateController,
            //   placeholder: hntOfferEndDate.tr,
            //   prefixIcon: Icons.calendar_today,
            // ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed:
                    controller.offer.value != null
                        ? controller.updateOffer
                        : controller.addOffer,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  controller.offer.value != null
                      ? btnUpdateOffer.tr
                      : btnNewOffer.tr,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildImagePicker() {
  //   return InkWell(
  //     onTap: () async {
  //       final XFile? pickedFile = await ImagePicker().pickImage(
  //         source: ImageSource.gallery,
  //       );
  //       if (pickedFile != null) {
  //         controller.imageFile.value = File(pickedFile.path);
  //       }
  //     },
  //     child: Center(
  //       child: Obx(
  //         () =>
  //             offerToUpdate.value?.image != null
  //                 ? Image.network(offerToUpdate.value!.image!)
  //                 : controller.imageFile.value != null
  //                 ? Card(
  //                   elevation: 4,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(12),
  //                   ),
  //                   child: ClipRRect(
  //                     borderRadius: BorderRadius.circular(12),
  //                     child: Image.file(
  //                       controller.imageFile.value!,
  //                       height: 120,
  //                       width: 120,
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                 )
  //                 : Card(
  //                   child: Icon(Icons.image_not_supported),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(12),
  //                   ),
  //                 ),
  //       ),
  //     ),
  //   );
  // // }

  // Widget _buildTextField(
  //   TextEditingController controller,
  //   String label, [
  //   TextInputType? inputType,
  // ]) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8),
  //     child: TextFormField(
  //       controller: controller,
  //       keyboardType: inputType,
  //       decoration: InputDecoration(
  //         labelText: label,
  //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  //         contentPadding: const EdgeInsets.symmetric(
  //           horizontal: 12,
  //           vertical: 14,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildDatePicker() {
  //   return SizedBox(
  //     height: 100,
  //     child: InkWell(
  //       onTap: () async {
  //         final pickedDate = await showDatePicker(
  //           context: Get.context!,
  //           initialDate: DateTime.now(),
  //           firstDate: DateTime(2022),
  //           lastDate: DateTime(2023),
  //         );
  //         if (pickedDate != null) {
  //           controller.startDateController.text = pickedDate.toString();
  //         }
  //       },
  //       child: Text("data"),
  //     ),
  //   );
  // }
}
