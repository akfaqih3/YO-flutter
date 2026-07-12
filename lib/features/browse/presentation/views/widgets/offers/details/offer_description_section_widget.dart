import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/offer_details_controller.dart';

class OfferDescriptionSectionWidget extends StatelessWidget {
  final String description;
  final int maxLines = 3;

  const OfferDescriptionSectionWidget({
    Key? key,
    required this.description,
    required this.controller,
  }) : super(key: key);
  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      // decoration: BoxDecoration(
      //   color: AppColors.white,
      //   borderRadius: BorderRadius.circular(12),
      //   boxShadow: [
      //     BoxShadow(
      //       color: AppColors.grey.withAlpha(10),
      //       blurRadius: 5,
      //       offset: const Offset(0, 2),
      //     ),
      //   ],
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "الوصف",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Obx(
            () => Text(
              description,
              style: TextStyle(color: Colors.grey[700], height: 1.5),
              maxLines:
                  controller.isDescriptionExpanded.value ? null : maxLines,
              overflow:
                  controller.isDescriptionExpanded.value
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,
            ),
          ),
          if (description.length >
              100) // Only show if description is long enough
            Obx(
              () => GestureDetector(
                onTap: controller.toggleDescriptionExpanded,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Text(
                        controller.isDescriptionExpanded.value
                            ? "عرض أقل"
                            : "قراءة المزيد",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        controller.isDescriptionExpanded.value
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColors.primary,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
