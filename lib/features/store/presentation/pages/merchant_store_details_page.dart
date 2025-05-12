// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:yemen_offers/features/offer/presentation/views/pages/merchant_offers_page.dart';
// import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_store_details_controller.dart';
// import 'package:yemen_offers/features/store/presentation/widgets/store_details_card_widget.dart';

// class MerchantStoreDetailsPage extends GetView<MerchantStoreDetailsController> {
//   const MerchantStoreDetailsPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("المتجر")),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//         return Column(
//           children: [
//             StoreDetailsCardWidget(store: controller.store.value!),
//             const SizedBox(height: 16),
//             MerchantOffersPage(),
//           ],
//         );
//       }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           controller.goToAddOffer();
//         },
//         child: const Icon(Icons.add),
//         backgroundColor: Colors.orange,
//         foregroundColor: Colors.white,
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/skeleton/offer_list_vertical_skeleton_widget.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_store_details_controller.dart';
import 'package:yemen_offers/features/store/presentation/widgets/merchant_store_header_widget.dart';
import 'package:yemen_offers/features/store/presentation/widgets/merchant_store_offers_list_widget.dart';

class MerchantStoreDetailsPage extends GetView<MerchantStoreDetailsController> {
  const MerchantStoreDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // الجزء الثابت: الهيدر + بطاقة المتجر
          Container(
            height: 290,
            color: const Color(0xFFF7F7F7),
            child: Stack(
              children: [
                // الخلفية الحمراء مع الصورة
                Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(
                        controller.store.value!.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                // بطاقة تفاصيل المتجر
                Positioned(
                  top: 170,
                  right: 20,
                  left: 20,
                  child: MerchantStoreHeaderWidget(controller.store.value!),
                ),
              ],
            ),
          ),

          // عنوان القسم الثابت
          const Padding(
            padding: EdgeInsets.only(top: 1, right: 35),
            child: Text(
              "العروض المتاحة",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Obx(
                () =>
                    controller.isLoading.value
                        ? const OfferListVerticalSkeletonWidget()
                        : controller.offers.isEmpty
                        ? Center(child: Text(lblNoOffers.tr))
                        : MerchantStoreOffersListWidget(
                          offers: controller.offers.value,
                        ),
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(
            AppRoutes.merchantAddUpdateOffer,
            arguments: {ApiKeys.store: controller.store.value!},
          );
        },
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 4,

        icon: const Icon(Iconsax.add_circle),
        label: Text(btnNewOffer.tr),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // الـ BottomNavigationBar يبقى كما هو
      // bottomNavigationBar: Container(
      //   height: 70,
      //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      //   color: const Color(0xFFE9E9E9),
      //   child: Row(
      //     children: [
      //       Expanded(
      //         child: Container(
      //           alignment: Alignment.center,
      //           decoration: BoxDecoration(
      //             color: Colors.orange,
      //             borderRadius: BorderRadius.circular(40),
      //           ),
      //           child:  Text(
      //             btnNewOffer.tr,
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontWeight: FontWeight.bold,
      //               fontSize: 16,
      //             ),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(width: 10),
      //     ],
      //   ),
      // ),
    );
  }
}
