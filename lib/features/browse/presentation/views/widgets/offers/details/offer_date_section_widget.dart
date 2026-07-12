import 'package:flutter/material.dart';
import 'package:yemen_offers/core/theme/colors.dart';

class OfferDateSectionWidget extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;

  const OfferDateSectionWidget({
    Key? key,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text(
                "تاريخ بدء العرض:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "${startDate?.month ?? '-'}/${startDate?.day ?? '-'}",
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: 1,
            color:  AppColors.primary,
          ),
          Column(
            children: [
              const Text(
                "تاريخ إنتاء العرض:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "${endDate?.month ?? '-'}/${endDate?.day ?? '-'}",
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}