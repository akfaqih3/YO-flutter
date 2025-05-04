import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/widgets/custom_text_field.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    lblLoginWelcome.tr,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    placeholder: hntEmail.tr,
                    prefixIcon: Icons.email,
                    controller: controller.emailController,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    placeholder: hntPassword.tr,
                    prefixIcon: Icons.lock,
                    obscureText: true,
                    controller: controller.passwordController,
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
                  const SizedBox(height: 24),
                  Obx(() {
                    return controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => controller.login(),
                            child: Text(btnLogin.tr),
                          ),
                        );
                  }),
                  const SizedBox(height: 12),
                  Obx(() {
                    return controller.isLoading.value
                        ? const SizedBox.shrink()
                        : SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () => controller.toRegister(),
                            child: Text(btnRegister.tr),
                          ),
                        );
                  }),
                  const SizedBox(height: 32),
                  Obx(() {
                    return controller.isLoading.value
                        ? const SizedBox.shrink()
                        // button google login wiht icon
                        : SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () => controller.googleLogin(),
                              child: Text(btnGoogleLogin.tr),
                            ),
                          );
                        
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
