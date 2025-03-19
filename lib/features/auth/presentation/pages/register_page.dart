import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) => controller.name.value = value,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) => controller.email.value = value,
            ),
            SizedBox(height: 16),
            Container(
              child: DropdownButton<String>(
                value: controller.genderOptions[controller.gender.value],
                onChanged:
                    (value) =>
                        controller.gender.value =
                            value ?? controller.gender.value,
                items:
                    controller.genderOptions.entries.map((e) {
                      return DropdownMenuItem(
                        value: e.value,
                        child: Text(e.key),
                      );
                    }).toList(),
                hint: Text(
                  'selecte gender',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              onChanged: (value) => controller.password.value = value,
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              onChanged: (value) => controller.confirmPassword.value = value,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => controller.register(),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
