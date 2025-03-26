import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/confirm_reset_password_controller.dart';

class ConfirmResetPasswordPage extends GetView<ConfirmResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تأكيد إعادة تعيين كلمة المرور")),
      body: Column(
        children: [
          TextField(
            // controller: controller.email,
            decoration: InputDecoration(labelText: "كلمة المرور الجديده"),
            onChanged: (value) => controller.password.value = value,
          ),
          SizedBox(height: 16),
          TextField(
            // controller: controller.email,
            decoration: InputDecoration(labelText: "كلمة المرور الجديده"),
          ),
          SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {
              controller.confirmResetPassword();
            },
            child: Text("إعادة تعيين كلمة المرور"),
          ),
        ],
      ),
    );
  }
}
