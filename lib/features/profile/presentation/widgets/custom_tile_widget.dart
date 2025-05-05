import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/theme/colors.dart';

class CustomTileWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  const CustomTileWidget({
    Key? key,
    required this.leadingIcon,
    required this.title,
    this.trailing,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // للتعرف على اتجاه اللغة
    final isRTL = Get.locale!.languageCode == 'ar';
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        leading: Icon(leadingIcon, color: iconColor ?? AppColors.primary, size: 26),
        title: Text(
          title,
          style: textStyle ?? TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
