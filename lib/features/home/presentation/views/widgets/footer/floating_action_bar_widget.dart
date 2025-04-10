import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';

class FloatingActionBarWidget extends StatelessWidget {
  const FloatingActionBarWidget({super.key, required this.selectedPage});
  final RxInt selectedPage;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed(AppRoutes.search);
      },
      child: Icon(Icons.search),
      backgroundColor: Colors.deepOrange,
      foregroundColor: Colors.white,
      elevation: 4,
      tooltip: "Search",
      shape: ShapeBorder.lerp(null, const StadiumBorder(), 0.5),
    );
  }
}
