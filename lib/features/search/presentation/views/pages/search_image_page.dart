import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/skeleton/offer_list_vertical_skeleton_widget.dart';
import 'package:yemen_offers/features/search/presentation/getX/controllers/search_controller.dart';
import 'package:yemen_offers/features/search/presentation/views/widgets/search_image_widget.dart';
import 'package:yemen_offers/features/search/presentation/views/widgets/search_offers_widget.dart';

class SearchImagePage extends GetView<SearchOffersController> {
  const SearchImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text("البحث بالصورة")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 100,
              child: Column(
                children: [
                  Text("بحث متقدم عن العروض من خلال صورة ", style: TextStyle()),
                  SizedBox(height: 10),
                  Text("قوم بادخال الصوره او قوم بتصويرها "),
                ],
              ),
            ),
            // شريط البحث
            Obx(() => SearchImageWidget(controller: controller)),
            const SizedBox(height: 10),

            // عدد العروض
            Row(
              children: [
                Text("${lblOffersCount.tr}: "),
                Obx(
                  () => Text(
                    "${controller.count.value}",
                    style: Get.textTheme.bodyMedium!.apply(
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // محتوى النتائج يأخذ المساحة الباقية بالضبط
            Expanded(
              child: Obx(() {
                if (controller.isloading.value) {
                  return const OfferListVerticalSkeletonWidget();
                }

                if (controller.offers.value.isEmpty) {
                  return Center(
                    child: Text(
                      lblNoOffers.tr,
                      style: Get.textTheme.bodyLarge!.apply(
                        color: AppColors.grey,
                      ),
                    ),
                  );
                }

                return SearchOffersWidget(offers: controller.offers.value);
              }),
            ),
          ],
        ),
      ),
    );
  }
}

// الكود السابق 
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
// import 'package:yemen_offers/core/theme/colors.dart';
// import 'package:yemen_offers/features/browse/presentation/views/widgets/skeleton/offer_list_vertical_skeleton_widget.dart';
// import 'package:yemen_offers/features/search/presentation/getX/controllers/search_controller.dart';
// import 'package:yemen_offers/features/search/presentation/views/widgets/search_bar_widget.dart';
// import 'package:yemen_offers/features/search/presentation/views/widgets/search_offers_widget.dart';

// class SearchPage extends GetView<SearchOffersController> {
//   const SearchPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Search")),
//       body: Column(
//         children: [
//           // search bar
//           const SizedBox(height: 10),
//           Obx(() => SearchBarWidget(controller: controller)),
//           const SizedBox(height: 10),
//           //show a count of results
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
            
//             children: [
//               Text(
//                 "${lblOffersCount.tr}: " 
//               ),
//               Obx(() => Text(
//                 "${controller.count.value}",
//                 style: Get.textTheme.bodyMedium!.apply(color: AppColors.secondary,),
//               )),
//             ],
//           ),
//           Obx(
//             () =>
//                 controller.isloading.value
//                     ? SizedBox(
//                       height: 700 ,
//                       child: const OfferListVerticalSkeletonWidget()
//                     )
//                     : controller.offers.value.isEmpty
//                     ?  Center(
//                         child: Text(
//                           lblNoOffers.tr,
//                           style: Get.textTheme.bodyLarge!.apply(color: AppColors.grey),
//                         ),
//                       )
//                     : SearchOffersWidget(offers: controller.offers.value),
//           ),
//         ],
//       ),
//     );
//   }
// }