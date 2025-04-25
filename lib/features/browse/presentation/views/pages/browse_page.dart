import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/core/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/header/browse_header_section_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/header/browse_offer_category_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/header/browse_search_bar_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/tabs/offer_tab_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/tabs/store_tab_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/footer/app_bottom_navigation_bar_widget.dart';

class BrowsePage extends GetView<BrowseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text("Browse"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(150),
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
                Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: controller.showTabs.value ? 48 : 0,
                    child: const TabBar(
                      tabs: [Tab(text: 'العروض'), Tab(text: 'المتاجر')],
                      labelColor: AppColors.secondary,
                      indicatorColor: AppColors.primary,
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Obx(() {
                        return controller.offers.value.isEmpty
                            ? const CircularProgressIndicator(
                              color: AppColors.primary,
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.secondary,
                              ),
                              semanticsLabel: 'العروض',
                            )
                            : OfferTabWidget(offers: controller.offers.value, scrollController: controller.scrollController);
                      }), 
                      Obx(() {
                        return controller.stores.value.isEmpty
                            ? const CircularProgressIndicator(
                              color: AppColors.primary,
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.secondary,
                              ),
                              semanticsLabel: 'المتاجر',
                            )
                            : StoreTabWidget(stores: controller.stores.value, scrollController: controller.scrollController);
          
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
