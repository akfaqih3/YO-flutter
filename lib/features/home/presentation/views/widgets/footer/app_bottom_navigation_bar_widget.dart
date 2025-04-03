import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomNavigationBarWidget extends StatelessWidget {
  const AppBottomNavigationBarWidget({Key? key, required this.selectedPage})
    : super(key: key);

  final RxInt selectedPage;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomNavClipper(fabSize: 48), // حجم الزر العائم
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
                color: Colors.black.withOpacity(0.2), // الظل سيكون أكثر وضوحًا
                blurRadius: 15, // جعل الظل ناعمًا أكبر
                spreadRadius: 4,
                offset: Offset(0, 4), // اتجاه الظل للأسفل قليلاً
              ),
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: NavigationBar(
            height: 80,
            elevation: 0, // إزالة التظليل الافتراضي
            backgroundColor: Colors.transparent, // جعل الخلفية شفافة
            indicatorColor: Colors.deepOrange.withOpacity(0.3),
            selectedIndex: selectedPage.value,
            onDestinationSelected: (index) => selectedPage.value = index,
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

// ✅ الاقتصاص الناعم مع تأثير الظل
class BottomNavClipper extends CustomClipper<Path> {
  final double fabSize;

  BottomNavClipper({required this.fabSize});

  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double radius = fabSize / 2 + 10; // نصف قطر أكبر للقص الناعم

    Path path =
        Path()
          ..moveTo(0, 0)
          ..lineTo((width / 2) - radius, 4)
          ..arcToPoint(
            Offset((width / 2) + radius, 4),
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
