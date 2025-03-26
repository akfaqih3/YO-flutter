import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/confirmation_account_controller.dart';

class ConfirmAccountPage extends GetView<ConfirmAccountController> {
  const ConfirmAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirm Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter the code sent to this ${controller.email.value}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Otp'),
              onChanged: (value) => controller.otp.value = value,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => controller.confirmAccount(),
              child: Text('Confirm Account'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => controller.resendOtpEmail(),
              child: Text(
                'Resend Otp Email',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
