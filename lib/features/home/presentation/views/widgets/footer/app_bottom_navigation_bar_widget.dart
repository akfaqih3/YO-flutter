import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/main_controller.dart';
import 'package:yemen_offers/features/home/presentation/views/pages/home_page.dart';
import 'package:yemen_offers/features/profile/presentation/pages/user_profile_page.dart';

class AppBottomNavigationBarWidget extends StatelessWidget {
  const AppBottomNavigationBarWidget({Key? key, required this.selectedPage})
    : super(key: key);

  final RxInt selectedPage;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomNavClipper(fabSize: 48),
      child: Obx(() {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade200],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 15,
                spreadRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: NavigationBar(
            height: 80,
            elevation: 0,
            backgroundColor: Colors.transparent,
            indicatorColor: Colors.deepOrange.withOpacity(0.3),
            selectedIndex: selectedPage.value,
            onDestinationSelected: (index) {
              selectedPage.value = index;
              index == 0
                  ? Get.find<MainController>().selected.value = HomePage()
                  : Get.find<MainController>().selected.value = UserProfilePage();
            },
            destinations: [
              _navItem(Icons.home, "Home", selectedPage.value == 0),
              _navItem(Icons.person, "Profile", selectedPage.value == 1),
            ],
          ),
        );
      }),
    );
  }

  NavigationDestination _navItem(IconData icon, String label, bool isSelected) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: isSelected ? Colors.deepOrange : Colors.grey,
        size: isSelected ? 28 : 24,
      ),
      label: label,
    );
  }
}

class BottomNavClipper extends CustomClipper<Path> {
  final double fabSize;

  BottomNavClipper({required this.fabSize});

  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double radius = fabSize / 2 + 10;

    Path path =
        Path()
          ..moveTo(0, 0)
          ..lineTo((width / 2) - radius, 0)
          ..arcToPoint(
            Offset((width / 2) + radius, 0),
            radius: Radius.circular(radius),
            clockwise: false,
          )
          ..lineTo(width, 0)
          ..lineTo(width, height)
          ..lineTo(0, height)
          ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
