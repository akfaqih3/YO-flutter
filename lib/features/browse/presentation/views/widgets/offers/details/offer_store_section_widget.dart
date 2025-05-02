import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';

class OfferStoreSectionWidget extends StatelessWidget {
  final dynamic store;
  final VoidCallback onTap;

  const OfferStoreSectionWidget({
    Key? key,
    required this.store,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(91, 158, 158, 158),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.grey[300]!,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(
                store.image ?? "",
                fit: BoxFit.cover,
                width: 60,
                height: 60,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image_not_supported,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  store.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: AppColors.primary,
                      ),
                    ),
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_outlined,
                          color: AppColors.primary,
                          size: 13,
                        ),
                        InkWell(
                          onTap: (){
                            // Get.toNamed(AppRoutes.storeDetails, arguments: store);
                          },
                          child: Text(
                            " تفاصيل اكثر",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}