import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/reset_password_controller.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("إعادة تعيين كلمة المرور")),
      body: Column(
        children: [
          TextField(
            // controller: controller.email,
            decoration: InputDecoration(labelText: "البريد الإلكتروني"),
            onChanged: (value) => controller.email.value = value,
          ),
          ElevatedButton(
            onPressed: () {
              controller.resetPassword();
            },
            child: Text("إعادة تعيين كلمة المرور"),
          ),
        ],
      ),
    );
  }
}
