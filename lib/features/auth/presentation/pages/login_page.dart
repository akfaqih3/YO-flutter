import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: const Text('Login'),
      centerTitle: true,
    ),
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
                const Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => controller.email.value = value,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => controller.password.value = value,
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.resetPassword);
                    },
                    child: const Text(
                      "Forgot password?",
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
                            child: const Text('Login'),
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
                            child: const Text('Register'),
                          ),
                        );
                }),
                const SizedBox(height: 32),
                Obx(() {
                  return controller.isLoading.value
                      ? const SizedBox.shrink()
                      : SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () => controller.googleLogin(),
                            child: const Text('login with google'),
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
