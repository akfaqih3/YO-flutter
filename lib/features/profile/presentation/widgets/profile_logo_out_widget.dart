import 'package:flutter/material.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/login_controller.dart';

class ProfileLogoOutWidget extends StatelessWidget {
  const ProfileLogoOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        LoginController.logout();
      },
      child: Icon(Icons.logout, size: 36, color: AppColors.primary),
    );
  }
}
