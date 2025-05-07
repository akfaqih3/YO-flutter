import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/app_assets.dart';
import 'package:yemen_offers/core/common/presentation/widgets/custom_text_field.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/confirmation_account_controller.dart';

class ConfirmAccountPage extends GetView<ConfirmAccountController> {
  const ConfirmAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lblConfirmAccount.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
                    AppAssets.appLogo,
                    width: 120,
                  ),
              
                  
                  const SizedBox(height: 24),
            Obx(
              () => Text(
                "تم إرسال رمز التحقق الخاص بك إلى ${controller.email.value}",
              ),
            ),
            SizedBox(height: 16),
            CustomTextField(
              placeholder: hntOtp.tr,
              controller: controller.otpController,
              prefixIcon: Icons.email,
            )
            ,
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => controller.confirmAccount(),
              child: Text(btnConfirmAccount.tr),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                controller.resendOtpEmail();
              },
              child: Text(
                btnResendOtpEmail.tr,
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
