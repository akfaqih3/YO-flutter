import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/common/presentation/widgets/form_items/email_text_field.dart';
import 'package:yemen_offers/core/common/presentation/widgets/form_items/password_text_field.dart';
import 'package:yemen_offers/core/constants/app_assets.dart';
import 'package:yemen_offers/core/common/presentation/widgets/custom_text_field.dart';
import 'package:yemen_offers/core/common/presentation/widgets/dropdown_text_field.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/core/utils/validators.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 32),
                Image.asset(AppAssets.appLogo, width: 120),
                SizedBox(height: 8),
                Text(
                  lblRegister.tr,
                  style: Get.textTheme.headlineLarge?.copyWith(
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 16),
                CustomTextField(
                  placeholder: hntName.tr,
                  prefixIcon: Icons.person,
                  controller: controller.nameController,
                  validator: validateName,
                ),
                SizedBox(height: 8),
                EmailTextField(
                  controller: controller.emailController,
                  placeholder: hntEmail.tr,
                  prefixIcon: Icons.email,
                ),
                SizedBox(height: 8),
                DropdownTextField(
                  options: controller.genderOptions.values.toList(),
                  hint: hntGender.tr,
                  prefixIcon: Icons.person,
                  controller: controller.genderController,
                ),

                SizedBox(height: 8),
                PasswordTextField(
                  controller: controller.passwordController,
                  placeholder: hntPassword.tr,
                  prefixIcon: Icons.lock,
                ),
                SizedBox(height: 8),
                PasswordTextField(
                  controller: controller.confirmPasswordController,
                  placeholder: hntConfirmPassword.tr,
                  prefixIcon: Icons.lock,
                ),

                Obx(() {
                  return controller.isRegisterLoading.value
                      ? const CircularProgressIndicator()
                      : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ElevatedButton(
                          onPressed: () => controller.register(),
                          child: Text(btnRegister.tr),
                        ),
                      );
                }),
                // register with google button
                SizedBox(height: 8),
                Obx(() {
                  return controller.isGoogleRegisterLoading.value
                      ? const CircularProgressIndicator.adaptive()
                      : OutlinedButton.icon(
                        icon: const Icon(Icons.g_mobiledata),
                        label: Text(btnGoogleRegister.tr),
                        onPressed: () => controller.RegisterWithGoogle(),
                      );
                }),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      lblAlreadyHaveAccount.tr,
                      style: Get.textTheme.bodySmall?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(AppRoutes.login);
                      },
                      child: Text(
                        btnLogin.tr,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
