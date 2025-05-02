import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategorySkeletonWidget extends StatelessWidget {
  const CategorySkeletonWidget({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 140,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: itemCount,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // الدائرة الرمادية مكان صورة التصنيف
                  Container(
                    width: 88,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  // مستطيل صغير مكان اسم التصنيف
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 40,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
