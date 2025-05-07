import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/theme/colors.dart';

class FloatingActionBarWidget extends StatefulWidget {
  const FloatingActionBarWidget({super.key, required this.selectedPage});
  final RxInt selectedPage;

  @override
  State<FloatingActionBarWidget> createState() =>
      _FloatingActionBarWidgetState();
}

class _FloatingActionBarWidgetState extends State<FloatingActionBarWidget>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 200,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Background blur effect when expanded
          AnimatedOpacity(
            opacity: isExpanded ? 0.9 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: IgnorePointer(
              ignoring: !isExpanded,
              child: GestureDetector(
                onTap: _toggleExpanded,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),

          // Image Search Button
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            bottom: isExpanded ? 140 : 20,
            right: isExpanded ? 0 : 15,
            child: AnimatedOpacity(
              opacity: isExpanded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 250),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(28),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primary.withOpacity(0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: FloatingActionButton.extended(
                    heroTag: 'imageSearch',
                    onPressed: () {
                      _toggleExpanded();
                      Get.toNamed(AppRoutes.search);
                    },
                    icon: const Icon(Icons.image_search,size: 24,),
                    label: SizedBox(),
                    backgroundColor: Colors.transparent,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ),

          // Text Search Button
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            bottom: isExpanded ? 80 : 20,
            right: isExpanded ? 0 : 15,
            child: AnimatedOpacity(
              opacity: isExpanded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 250),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(28),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primary.withOpacity(0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: FloatingActionButton.extended(
                    heroTag: 'textSearch',
                    onPressed: () {
                      _toggleExpanded();
                      Get.toNamed(AppRoutes.search);
                    },
                    icon: const Icon(Iconsax.text,size: 24,),
                    label: SizedBox(),
                    backgroundColor: Colors.transparent,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ),

          // Main FAB
          Positioned(
            bottom: 32,
            right: 15,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    blurRadius: isExpanded ? 12 : 8,
                    spreadRadius: isExpanded ? 2 : 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                elevation: 0,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primary.withOpacity(0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FloatingActionButton(
                    heroTag: 'mainFAB',
                    onPressed: _toggleExpanded,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    foregroundColor: AppColors.white,
                    child: AnimatedRotation(
                      turns: isExpanded ? 0.125 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        isExpanded ? Icons.close : Iconsax.search_normal,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
