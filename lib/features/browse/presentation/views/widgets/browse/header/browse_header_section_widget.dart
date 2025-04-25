// import 'package:flutter/material.dart';
// import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/header/browse_search_bar_widget.dart';

// class BrowseHeaderSectionWidget extends StatelessWidget {
//   const BrowseHeaderSectionWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         BrowseSearchBarWidget(),
//         const SizedBox(width: 8),
//         const Icon(Icons.south_rounded),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/header/browse_offer_category_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/header/browse_search_bar_widget.dart';

class BrowseHeaderSectionWidget extends StatelessWidget {
  const BrowseHeaderSectionWidget({super.key, required this.controller});

  final BrowseController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: BrowseSearchBarWidget()),
                const SizedBox(width: 8),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1 / 2,
                  child: InkWell(
                    onTap: () {
                      // open sort dialog
                      Get.bottomSheet(
                        SortDialogWidget(controller: controller),
                        elevation: 4,
                        enterBottomSheetDuration: const Duration(
                          milliseconds: 256,
                        ),
                        exitBottomSheetDuration: const Duration(
                          milliseconds: 256,
                        ),
                        barrierColor: Colors.transparent,
                        isScrollControlled: true,
                        backgroundColor: AppColors.white,
                      );
                    },
                    child: const Icon(
                      Icons.sort_rounded,
                      size: 36,
                      color: AppColors.secondary,
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

class SortDialogWidget extends StatelessWidget {
  SortDialogWidget({super.key, required this.controller});
  final BrowseController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text(
            "hntSort.tr",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.sortOptions.length,
              itemBuilder: (context, index) {
                final String sortOption = controller.sortOptions[index];
                return ListTile(
                  title: Text(
                    sortOption,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Radio(
                    value: sortOption,
                    groupValue: controller.sortBy.value,
                    onChanged: (value) {
                      controller.sortBy.value = value ?? "price";
                    },
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "hntClose.tr",
                  style: TextStyle(color: AppColors.primary, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
