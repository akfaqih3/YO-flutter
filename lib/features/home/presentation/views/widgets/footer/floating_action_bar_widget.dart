import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/theme/colors.dart';
class FloatingActionBarWidget extends StatefulWidget {
  const FloatingActionBarWidget({super.key, required this.selectedPage});
  final RxInt selectedPage;

  @override
  State<FloatingActionBarWidget> createState() => _FloatingActionBarWidgetState();
}

class _FloatingActionBarWidgetState extends State<FloatingActionBarWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110, // حدد عرض ثابت حتى لا يسبب مشاكل
      height: 190, // حدد ارتفاع ثابت
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // الزر 1 - البحث بالصورة
          if (isExpanded)
            Positioned(
              bottom: 140,
              right: 0,
              child: FloatingActionButton.extended(
                heroTag: 'imageSearch',
                onPressed: () {
                   setState(() {
                  isExpanded = !isExpanded;
                });
                  Get.toNamed(AppRoutes.search);
                },
                icon: const Icon(Icons.image_search_sharp),
                label: const Text('بحث بالصورة'),
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
              ),
            ),

          // الزر 2 - البحث بالكلمة
          if (isExpanded)
            Positioned(
              bottom: 80,
              right: 0,
              child: FloatingActionButton.extended(
                heroTag: 'textSearch',
                onPressed: () {
                   setState(() {
                  isExpanded = !isExpanded;
                });
                  Get.toNamed(AppRoutes.search);
                },
                icon: const Icon(Icons.search_rounded),
                label: const Text('بحث بالكلمة'),
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                clipBehavior: Clip.antiAlias,
              ),
            ),

          // الزر الرئيسي
          Positioned(
            bottom: 20,
            right: 15,
            left: 27,
            child: FloatingActionButton(
              heroTag: 'mainFAB',
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Icon(isExpanded ? Icons.close : Icons.search),
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
