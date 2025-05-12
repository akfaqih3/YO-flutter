import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/join_as_merchant_controller.dart';

class CustomImagePickerField extends StatelessWidget {
  const CustomImagePickerField({
    super.key,
    required this.controller,
    this.height = 100,
  });

  final controller;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hntStoreLogo.tr,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              controller.pickImage();
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: height,
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
                                lblTapToUpload.tr,
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
    );
  }
}
