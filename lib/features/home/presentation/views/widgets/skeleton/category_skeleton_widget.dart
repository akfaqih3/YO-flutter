import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategorySkeletonWidget extends StatelessWidget {
  const CategorySkeletonWidget({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: itemCount,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            return Column(
              children: [
                // الدائرة الرمادية مكان صورة التصنيف
                Container(
                  width: 88,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                // مستطيل صغير مكان اسم التصنيف
                Container(
                  width: 40,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
