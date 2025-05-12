import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/app_assets.dart';
import 'package:yemen_offers/core/common/presentation/widgets/custom_text_field.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/utils/validators.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/reset_password_controller.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lblForgotPassword.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(AppAssets.appLogo, width: 120),
              const SizedBox(height: 64),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      placeholder: hntEmail.tr,
                      prefixIcon: Icons.email,
                      controller: controller.emailController,
                      validator: validateEmail,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        controller.resetPassword();
                      },
                      child: Text(btnForgotPassword.tr),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
