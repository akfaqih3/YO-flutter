import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';

class BrowseSearchBarWidget extends StatelessWidget {
  const BrowseSearchBarWidget({super.key, required this.controller});

  final  controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.only(left: 8),

      child: TextFormField(
        onChanged: (value) {
          controller.searchQuery.value = value;
        },
        onEditingComplete: () {
          controller.getOffers();
        },
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,

        decoration: InputDecoration(
          hintText: hntSearch.tr,
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.secondary.withAlpha(100),
          ),
        ),
        showCursor: true,
      ),
    );
  }
}
