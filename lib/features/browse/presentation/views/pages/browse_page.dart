import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/header/browse_header_section_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/offer_category_list_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/tabs/browse_tap_bar_view_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/tabs/browse_tap_bar_widget.dart';

class BrowsePage extends GetView<BrowseController> {
  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale?.languageCode == 'ar';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Obx(() => Text(
          isRTL? controller.selectedCategory.value?.nameAr ?? lblcategory.tr : controller.selectedCategory.value?.name ?? lblcategory.tr,
        )),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: BrowseHeaderSectionWidget(controller: controller),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Obx(() {
                  return controller.selectedTabIndex.value == 0
                      ? OfferCategoryListWidget(controller: controller)
                      : const SizedBox();
                }),
                SizedBox(height: 4),
                Obx(
                  () => BrowseTapBarWidget(isShow: controller.showTabs.value),
                ),
                BrowseTapBarViewWidget(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
