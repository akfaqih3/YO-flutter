import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';

class AppBottomNavigationBarWidget extends StatelessWidget {
  const AppBottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items:  [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'المتاجر'),
        BottomNavigationBarItem(
          icon: InkWell(child: Icon(Icons.favorite),onTap:(){
            Get.toNamed(AppRoutes.favorites);
          },),
          label: 'المفضلة',
        ),
      ],
      currentIndex: 0,
      onTap: (index) {},
    );
  }
}
