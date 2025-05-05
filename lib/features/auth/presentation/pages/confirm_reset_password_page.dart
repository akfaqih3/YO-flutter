import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/app_assets.dart';
import 'package:yemen_offers/core/presentation/widgets/custom_text_field.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/confirm_reset_password_controller.dart';

class ConfirmResetPasswordPage extends GetView<ConfirmResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lblConfirmResetPassword.tr)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AppAssets.appLogo, width: 120),
            Column(
              children: [
                const SizedBox(height: 64),
                CustomTextField(
                  placeholder: hntPassword.tr,
                  controller: controller.password,
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  placeholder: hntConfirmPassword.tr,
                  controller: controller.confirmPassword,
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 8),

                Obx(
                  () =>
                      controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                            onPressed: () {
                              controller.confirmResetPassword();
                            },
                            child: Text(lblConfirmResetPassword.tr),
                          ),
                ),
              ],
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
