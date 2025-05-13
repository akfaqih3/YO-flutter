import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/store/domain/entities/merchant_store_etity.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_stores_controller.dart';

class MerchantStoreHeaderWidget extends GetView<MerchantStoresController> {
  const MerchantStoreHeaderWidget(this.store, {super.key});
  final MerchantStoreEtity store;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // الصف العلوي: الصورة + الاسم + زر الاتصال
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
              left: 5,
              right: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // الاسم مع الصورة الدائرية
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: ClipOval(
                        child:
                            store.image != null
                                ? Image.network(store.image!, fit: BoxFit.cover)
                                : null,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          store.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.black,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 13,
                              ),
                              SizedBox(width: 4),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    AppRoutes.merchantAddStore,
                                    arguments: {ApiKeys.store: store},
                                  );
                                },
                                child: Text(
                                  btnViewDetails.tr,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 10),
                  ],
                ),
                // زر الاتصال
                GestureDetector(
                  onTap: () {
                    // هنا تضع منطق الاتصال
                  },
                  child: Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "اتصال",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 4),

                        Icon(Icons.phone, color: Colors.white, size: 14),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 15),
          // child:
          //
          // // الرابط إلى الانستقرام
          //
          // Container(
          //   width: 100,
          //   height: 30,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(40),
          //     color: Colors.black,
          //   ),
          //   padding: const EdgeInsets.symmetric(horizontal: 12),
          //   child: Row(
          //     children: const [
          //       Icon(
          //         Icons.arrow_forward_ios,
          //         color: Colors.white,
          //         size: 13,
          //       ),
          //       SizedBox(width: 4),
          //       Text(
          //         'تفاصيل أكثر',
          //         style: TextStyle(color: Colors.white, fontSize: 12),
          //       ),
          //     ],
          //   ),
          // ),),
          /////////////////////////
        ],
      ),
    );
  }
}
