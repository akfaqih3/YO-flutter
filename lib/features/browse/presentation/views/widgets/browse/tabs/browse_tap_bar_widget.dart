import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';

class BrowseTapBarWidget extends StatelessWidget {
  const BrowseTapBarWidget({super.key, required this.isShow});

  final bool isShow;

  @override
  Widget build(BuildContext context) {  
    final controller = Get.find<BrowseController>();
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: isShow ? 48 : 0,
      child:  TabBar(
        controller: controller.tabController,
        tabs: [Tab(text: lblOffers.tr), Tab(text: lblStores.tr)],
        labelColor: AppColors.secondary,
        indicatorColor: AppColors.primary,
        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
