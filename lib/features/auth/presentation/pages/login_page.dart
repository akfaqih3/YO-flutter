import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/common/presentation/widgets/form_items/email_text_field.dart';
import 'package:yemen_offers/core/common/presentation/widgets/form_items/password_text_field.dart';
import 'package:yemen_offers/core/constants/app_assets.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/common/presentation/widgets/custom_text_field.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/core/utils/validators.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),

            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.appLogo, width: 120),
                  const SizedBox(height: 24),

                  Text(
                    lblLoginWelcome.tr,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        EmailTextField(
                          controller: controller.emailController,
                          placeholder: hntEmail.tr,
                          prefixIcon: Icons.email,
                        ),
                        const SizedBox(height: 8),

                        PasswordTextField(
                          placeholder: hntPassword.tr,
                          prefixIcon: Icons.lock,
                          controller: controller.passwordController,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.resetPassword);
                      },
                      child: Text(
                        btnForgotPassword.tr,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Obx(() {
                      return controller.isLoginLoading.value
                          ? Center(
                            child: const CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          )
                          : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => controller.login(),
                              child: Text(btnLogin.tr),
                            ),
                          );
                    }),
                  ),

                  const SizedBox(height: 16),
                  Obx(() {
                    return controller.isGoogleLoginLoading.value
                        ? const CircularProgressIndicator.adaptive()
                        // button google login wiht icon
                        : SizedBox(
                          // width: MediaQuery.of(context).size.width * 0.5,
                          child: OutlinedButton.icon(
                            onPressed: () => controller.googleLogin(),
                            icon: const Icon(Icons.g_mobiledata_rounded),
                            label: Text(btnGoogleLogin.tr),
                          ),
                        );
                  }),
                  const SizedBox(height: 32),

                  // line separator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        // lblNoAccount.tr+' ?',
                        "${lblNoAccount.tr} ?",
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(AppRoutes.register);
                        },
                        child: Text(
                          btnRegister.tr,
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
      ),
    );
  }
}
