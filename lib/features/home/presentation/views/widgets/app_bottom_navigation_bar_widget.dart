import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/home_controller.dart';

class AppBottomNavigationBarWidget extends StatelessWidget {
  const AppBottomNavigationBarWidget({Key? key, required this.selectedPage})
    : super(key: key);

  // final HomeController controller;
  final RxInt selectedPage;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return NavigationBar(
        height: 80,
        elevation: 0,
        backgroundColor: Colors.white,
        indicatorColor: Colors.black.withOpacity(0.1),
        selectedIndex: selectedPage.value,
        onDestinationSelected: (index) => selectedPage.value = index,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.orange),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline, color: Colors.orange),
            label: 'Stores',
          ),
           NavigationDestination(
            icon: Icon(Icons.person, color: Colors.orange),
            label: 'Profile',
          ),
        ],
      );
    });
  }
}
