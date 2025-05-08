import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';

class StoreCardDetailsWidget extends StatelessWidget {
  const StoreCardDetailsWidget({super.key, required this.store});
  final StoreEntity store;
  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale?.languageCode == 'ar';
    final isDarkMode = Get.isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(91, 158, 158, 158),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصف العلوي: الصورة + الاسم + زر الاتصال
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Get.theme.scaffoldBackgroundColor,
                          border: Border.all(
                            color: AppColors.primary.withAlpha(200),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withAlpha(300),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.network(
                            store.image ?? "",
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) => Icon(
                                  Iconsax.shop_copy,
                                  color: AppColors.primary,
                                  size: 32,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        width: 180,
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              store.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            // show store category , address and phone
                            Text(
                              "${lblcategory.tr}: ${store.category.nameAr}",
                              style: const TextStyle(color: AppColors.grey),
                              maxLines: 1,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "${lblPhone.tr}: ${store.phone}",
                              style: const TextStyle(color: AppColors.grey),
                              maxLines: 1,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "${lblAdress.tr}: ${store.address}",
                              style: const TextStyle(color: AppColors.grey),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
              
                      const SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(
                    width: 70,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 70,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                        child: Row(
                          children: [
                            Text(
                              btnCall.tr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    isDarkMode ? AppColors.black : AppColors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 4),
                    
                            Icon(Icons.phone, color: AppColors.primary, size: 14),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 20, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // make this clickable to open url link
                GestureDetector(
                  onTap: () async {
                    launchUrl(Uri.parse(store.socialMedia?.facebook ?? ""));
                  },
                  child: Text(
                    "${lblFacebook.tr}: ${store.socialMedia?.facebook}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),

                SizedBox(height: 4),

                // make this clickable to open url link
                GestureDetector(
                  onTap: () async {
                    launchUrl(Uri.parse(store.socialMedia?.instagram ?? ""));
                  },
                  child: Text(
                    "${lblInstagram.tr}: ${store.socialMedia?.instagram}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),

                SizedBox(height: 4),

                // make this clickable to open url link
                GestureDetector(
                  onTap: () async {
                    launchUrl(Uri.parse(store.socialMedia?.snapchat ?? ""));
                  },
                  child: Text(
                    "${lblSnapchat.tr}: ${store.socialMedia?.snapchat}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          /////////////////////////
        ],
      ),
    );
  }
}
