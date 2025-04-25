import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';

class BrowseSearchBarWidget extends StatelessWidget {
  const BrowseSearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BrowseController>();
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondary.withAlpha(100)),
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextFormField(
        onChanged: (value) {
          controller.searchQuery.value = value;
        },
        onEditingComplete: (){
          controller.getOffers();
        },
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        strutStyle: StrutStyle(
          forceStrutHeight: true,
          height: 1.0,
          leading: 1.0,
          fontSize: 16,
        ),
        style: TextStyle(color: AppColors.secondary, fontSize: 16),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: hntSearch.tr,
          border: InputBorder.none,
          hintStyle: TextStyle(color: AppColors.secondary.withAlpha(100)),
          prefixIcon: Icon(Icons.search, color: AppColors.secondary.withAlpha(100)),
        ),
        showCursor: true,
      ),
    );
  }
}
