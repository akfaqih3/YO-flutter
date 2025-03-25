import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/offer/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/offer/presentation/getX/controllers/merchant_add_update_offer_controller.dart';

class OfferFormWidget extends StatelessWidget {
  final MerchantAddUpdateOfferController controller;
  final bool isUpdate;

  const OfferFormWidget({
    super.key,
    required this.controller,
    required this.isUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImagePicker(),
          const SizedBox(height: 16),
          _buildCategoryDropdown(),
          _buildTextField(controller.titleController, "عنوان العرض"),
          _buildTextField(controller.descriptionController, "وصف العرض"),
          _buildTextField(
            controller.priceBeforeController,
            "السعر قبل الخصم",
            TextInputType.number,
          ),
          _buildTextField(
            controller.priceAfterController,
            "السعر بعد الخصم",
            TextInputType.number,
          ),
          _buildTextField(controller.startDateController, "تاريخ البدء"),
          _buildTextField(controller.endDateController, "تاريخ الانتهاء"),

          const SizedBox(height: 16),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:
                  isUpdate ? controller.updateOffer : controller.addOffer,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                isUpdate ? "تحديث العرض" : "إضافة العرض",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePicker() {
    return InkWell(
      onTap: () {
        controller.chooseImage();
      },
      child: Center(
        child: Obx(
          () =>
              controller.imageFile.value != null
                  ? Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(controller.imageFile.value!.path),
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  : Card(
                    child: Icon(Icons.image_not_supported),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, [
    TextInputType? inputType,
  ]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Obx(() {
      final List<OfferCategoryEntity> categories =
          controller.offerCategories.value;
      return DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: "الفئة",
          border: OutlineInputBorder(),
        ),
        value:
            (controller.selectedOfferCategory.value.isEmpty)
                ? categories.first.slug
                : controller.selectedOfferCategory.value,
        items:
            categories
                .map(
                  (e) => DropdownMenuItem(value: e.slug, child: Text(e.name)),
                )
                .toList(),
        onChanged: (value) => controller.selectedOfferCategory(value),
      );
    });
  }

  Widget _buildDatePicker() {
    return SizedBox(
      height: 100,
      child: InkWell(
        onTap: () async {
          final pickedDate = await showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2023),
          );
          if (pickedDate != null) {
            controller.startDateController.text = pickedDate.toString();
          }
        },
        child: Text("data"),
      ),
    );
  }
}
