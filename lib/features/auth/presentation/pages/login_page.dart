import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) => controller.email.value = value,
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              onChanged: (value) => controller.password.value = value,
            ),
            InkWell(
              child: Text(
                "reset password",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Get.toNamed(AppRoutes.resetPassword);
              },
            ),
            SizedBox(height: 32),
            Obx(() {
              return controller.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: () => controller.login(),
                    child: Text('Login'),
                  );
            }),
          ],
        ),
      ),
    );
  }
}
