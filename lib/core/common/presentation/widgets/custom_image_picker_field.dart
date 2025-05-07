import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/join_as_merchant_controller.dart';

class CustomImagePickerField extends StatelessWidget {
  const CustomImagePickerField({super.key, required this.controller});

  final JoinAsMerchantController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),

          border: Border.all(
            style: BorderStyle.solid,
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Store Logo',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                controller.pickImage();
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey,
                    style:
                        BorderStyle
                            .solid, // Change to dotted if using custom painter
                    width: 1.5,
                  ),
                ),
                child: Obx(
                  () =>
                      controller.storeImage.value != null
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              controller.storeImage.value!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          )
                          : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_photo_alternate_outlined,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'Tap to upload',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
