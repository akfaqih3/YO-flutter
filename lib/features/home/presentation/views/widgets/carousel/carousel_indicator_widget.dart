import 'package:flutter/material.dart';

class CarouselIndicatorWidget extends StatelessWidget {
   CarouselIndicatorWidget({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding,
    this.child,
    this.margin,
    this.showBorder = false,
    this.backgroundColor = Colors.white,
    this.borderColor = darkGrey,
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final bool showBorder;
  final Color backgroundColor;
  final Color borderColor;
  static const Color darkGrey = Color(0XD9D9D9FF);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null
      ),
      child: child,
    );
  }
}
