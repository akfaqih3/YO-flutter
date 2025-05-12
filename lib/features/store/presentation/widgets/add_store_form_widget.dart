import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemen_offers/core/common/presentation/widgets/build_category_dropdown.dart';
import 'package:yemen_offers/core/common/presentation/widgets/custom_address_text_field.dart';
import 'package:yemen_offers/core/common/presentation/widgets/custom_image_picker_field.dart';
import 'package:yemen_offers/core/common/presentation/widgets/custom_text_field.dart';
import 'package:yemen_offers/core/common/presentation/widgets/image_picker_field_widget.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/utils/map_util.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_add_store_controller.dart';

class AddStoreFormWidget extends StatelessWidget {
  final MerchantAddStoreController controller;

  AddStoreFormWidget({required this.controller});
  var storeToUpdate;
  @override
  Widget build(BuildContext context) {
    final List<CategoryEntity> categories = controller.categories;
    storeToUpdate = controller.storeToUpdate;

    // if (storeToUpdate.value != null) {
    //   controller.nameController.text = storeToUpdate.value!.name;
    //   controller.descriptionController.text =
    //       storeToUpdate.value!.description ?? "";
    //   controller.selectedCategory(storeToUpdate.value!.category);
    //   controller.phoneController.text = storeToUpdate.value!.phone;
    //   controller.websiteController.text = storeToUpdate.value!.website ?? "";
    //   controller.addressController.text = storeToUpdate.value!.address ?? "";
    //   controller.facebookController.text =
    //       storeToUpdate.value!.socialMedia?["facebook"] ?? "";
    //   controller.instagramController.text =
    //       storeToUpdate.value!.socialMedia?["instagram"] ?? "";
    //   controller.snapchatController.text =
    //       storeToUpdate.value!.socialMedia?["snapchat"] ?? "";
    // }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildCategoryDropdown(
                controller: controller,
                categories: categories,
              ),
              CustomTextField(
                controller: controller.nameController,
                placeholder: hntStoreName.tr,
              ),
              CustomTextField(
                controller: controller.phoneController,
                placeholder: hntStorePhone.tr,
              ),
              CustomAddressTextField(
                addressTextEditingController: controller.addressController,
                latitude: controller.latitude,
                longitude: controller.longitude,
              ),
              CustomTextField(
                controller: controller.websiteController,
                placeholder: hntWebsite.tr,
              ),
              ImagePickerFieldWidget(
                onTap: () {
                  controller.pickImage();
                },
                imagePath: controller.imageFile,
                labelText: hntStoreLogo.tr,
              ),
              CustomTextField(
                controller: controller.descriptionController,
                placeholder: hntStoreDescription.tr,
              ),
              CustomTextField(
                controller: controller.facebookController,
                placeholder: lblFacebook.tr,
              ),
              CustomTextField(
                controller: controller.instagramController,
                placeholder: lblInstagram.tr,
              ),
              CustomTextField(
                controller: controller.snapchatController,
                placeholder: lblSnapchat.tr,
              ),
              _buildSubmitButton(),
              // _buildTextField(controller.nameController, "الاسم"),
              // _buildTextField(controller.phoneController, "الرقم الالكتروني"),
              // _buildAddressField(),
              // _buildTextField(controller.websiteController, "الموقع"),
              // _buildTextField(controller.descriptionController, "الوصف"),
              // BuildCategoryDropdown(controller: controller, categories: categories),
              // _buildImagePicker(),
              // _buildSocialMediaFields(),
              // const SizedBox(height: 10),
              // _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return SizedBox(
      height: 100,
      child: InkWell(
        onTap: () async {
          final pickedFile = await ImagePicker().pickImage(
            source: ImageSource.gallery,
          );
          if (pickedFile != null) {
            controller.imageFile.value = File(pickedFile.path);
          }
        },
        child: Obx(
          () =>
              storeToUpdate.value?.image != null
                  ? Image.network(storeToUpdate.value!.image!)
                  : (controller.imageFile.value == null
                      ? Icon(
                        Icons.add_a_photo,
                        color: Colors.greenAccent,
                        size: 50,
                      )
                      : Image.file(controller.imageFile.value!)),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed:
            () =>
                storeToUpdate.value != null
                    ? controller.updateStore()
                    : controller.addStore(),
        child: Text(storeToUpdate.value != null ? btnUpdate.tr : btnDelete.tr),
      ),
    );
  }
}
