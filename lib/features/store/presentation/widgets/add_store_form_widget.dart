import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemen_offers/core/utils/map_util.dart';
import 'package:yemen_offers/features/store/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_add_store_controller.dart';

class AddStoreFormWidget extends StatelessWidget {
  final MerchantAddStoreController controller;

  AddStoreFormWidget({required this.controller});
  var storeToUpdate;
  @override
  Widget build(BuildContext context) {
    final List<CategoryEntity> categories = controller.categories;
    storeToUpdate = controller.storeToUpdate;

    if (storeToUpdate.value != null) {
      controller.nameController.text = storeToUpdate.value!.name;
      controller.descriptionController.text =
          storeToUpdate.value!.description ?? "";
      controller.selectedCategory(storeToUpdate.value!.category);
      controller.phoneController.text = storeToUpdate.value!.phone;
      controller.websiteController.text = storeToUpdate.value!.website ?? "";
      controller.addressController.text = storeToUpdate.value!.address ?? "";
      controller.facebookController.text =
          storeToUpdate.value!.socialMedia?["facebook"] ?? "";
      controller.instagramController.text =
          storeToUpdate.value!.socialMedia?["instagram"] ?? "";
      controller.twitterController.text =
          storeToUpdate.value!.socialMedia?["twitter"] ?? "";
      controller.youtubeController.text =
          storeToUpdate.value!.socialMedia?["youtube"] ?? "";
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(controller.nameController, "الاسم"),
              _buildTextField(controller.phoneController, "الرقم الالكتروني"),
              _buildAddressField(),
              _buildTextField(controller.websiteController, "الموقع"),
              _buildTextField(controller.descriptionController, "الوصف"),
              _buildCategoryDropdown(categories),
              _buildImagePicker(),
              _buildSocialMediaFields(),
              const SizedBox(height: 10),
              _buildSubmitButton(),
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

  Widget _buildAddressField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller.addressController,
        readOnly: true, // اجعل الحقل غير قابل للتحرير مباشرة
        decoration: InputDecoration(
          labelText: "العنوان",
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(Icons.map, color: Colors.blue),
            onPressed:
                () => {
                  MapUtil.selectLocation(
                    addressController: controller.addressController,
                    latitude: controller.latitude,
                    longitude: controller.longitude,
                  ),
                },
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown(List<CategoryEntity> categories) {
    return Obx(
      () => DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: "الفئة",
          border: OutlineInputBorder(),
        ),
        value:
            (controller.selectedCategory.value.isEmpty)
                ? categories.first.slug
                : controller.selectedCategory.value,
        items:
            categories
                .map(
                  (e) => DropdownMenuItem(value: e.slug, child: Text(e.name)),
                )
                .toList(),
        onChanged: (value) => controller.selectedCategory(value!),
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

  Widget _buildSocialMediaFields() {
    return Column(
      children: [
        _buildTextField(controller.facebookController, "Facebook"),
        _buildTextField(controller.instagramController, "Instagram"),
        _buildTextField(controller.twitterController, "Twitter"),
        _buildTextField(controller.youtubeController, "YouTube"),
      ],
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
        child: Text(
          storeToUpdate.value != null ? "تعديل المتجر" : "إضافة متجر",
        ),
      ),
    );
  }
}
