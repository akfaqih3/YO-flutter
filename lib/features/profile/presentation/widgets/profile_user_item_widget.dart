import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/main_controller.dart';
import 'package:yemen_offers/features/home/presentation/views/pages/main_page.dart';
import 'package:yemen_offers/features/profile/domain/entities/user_entity.dart';

class ProfileUserItemWidget extends StatelessWidget {
  const ProfileUserItemWidget({super.key, this.user});

  final UserEntity? user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        user == null
            ? Get.toNamed(AppRoutes.login)
            : Get.find<MainController>().selected.value = MainPage();
      },
      child: SizedBox(
        height: 128,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: AppColors.grey.withAlpha(300),
                  child: Icon(
                    user == null ? Iconsax.login_copy : Iconsax.user_copy,
                    size: 32,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.name ?? lblGuest.tr,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF222222),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        user?.email ?? lblTapToLogin.tr,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
