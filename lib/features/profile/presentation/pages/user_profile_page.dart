import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:yemen_offers/core/constants/app_assets.dart';
import 'package:yemen_offers/core/common/presentation/widgets/dropdown_text_field.dart';
import 'package:yemen_offers/core/common/presentation/widgets/profile_item_switch_widget.dart';
import 'package:yemen_offers/core/common/presentation/widgets/profile_item_widget.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/services/theme_service.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/auth/presentation/getX/controllers/login_controller.dart';
import 'package:yemen_offers/features/profile/domain/entities/user_entity.dart';
import 'package:yemen_offers/features/profile/presentation/getX/controllers/user_profile_controller.dart';
import 'package:yemen_offers/features/profile/presentation/widgets/custom_tile_widget.dart';
import 'package:yemen_offers/features/profile/presentation/widgets/logout_button_widget.dart';
import 'package:yemen_offers/features/profile/presentation/widgets/profile_logo_out_widget.dart';
import 'package:yemen_offers/features/profile/presentation/widgets/profile_user_item_widget.dart';

class UserProfilePage extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale?.languageCode == 'ar';
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        
            // Header Texts
            Column(
              children: [
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                //   child:Align(
                //     alignment: isRTL? Alignment.centerLeft : Alignment.centerRight,
                //     child: Image.asset(
                //           AppAssets.appLogo,
                //           width: MediaQuery.of(context).size.width * 0.13,
                //         ),
                //   ),
                // ),
                
                // Profile Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Obx(() {
                    return controller.loading.value
                        ? const CircularProgressIndicator()
                        : ProfileUserItemWidget(user: controller.user.value);
                  }),
                ),
              ],
            ),
        
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    CustomTileWidget(
                      leadingIcon: Icons.favorite_border,
                      title: lblFavorites.tr,
                      onTap: () {
                        Get.toNamed(AppRoutes.favorites);
                      },
                      iconColor: AppColors.primary,
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.grey,
                      ),
                    ),
                    Obx(() {
                      return controller.user.value == null
                          ? SizedBox()
                          : controller.user.value?.userType == "consumer"
                          ? CustomTileWidget(
                            leadingIcon: Icons.store_rounded,
                            title: lblJoinAsMerchant.tr,
                            onTap: () {
                              Get.toNamed(AppRoutes.joinAsMerchant);
                            },
                            iconColor: AppColors.primary,
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.grey,
                            ),
                          )
                          : CustomTileWidget(
                            leadingIcon: Iconsax.shop_copy,
                            title: lblStores.tr,
                            onTap: () {
                              Get.toNamed(AppRoutes.merchantStores);
                            },
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.grey,
                            ),
                          );
                    }),
                    CustomTileWidget(
                      leadingIcon: Iconsax.moon_copy,
                      title: lbldarkMode.tr,
                      trailing: Obx(
                        ()=> Switch(
                        value: controller.isDark.value,
                        onChanged: (value){
                          controller.toggleMode(value);
                        },
                      ),
                      )
                    ),
                    //drowp down to show language
                    CustomTileWidget(
                      leadingIcon: Iconsax.global_copy,
                      title: lbllanguage.tr,
                      trailing: DropdownButtonHideUnderline(
                        child: DropdownButton<dynamic>(
                          value: controller.selectedLanguage.value,
                          items:
                              controller.languages.value.entries.map((e) {
                                return DropdownMenuItem<dynamic>(
                                  value: e.value,
                                  child: Text(e.key),
                                );
                              }).toList(),
                          icon: const Icon(Icons.arrow_drop_down),
                          onChanged: (value) {
                            controller.changeLanguage(value.toString());
                          },
                        ),
                      ),
                    ),
                    CustomTileWidget(
                      leadingIcon: Iconsax.call_copy,
                      title: lblContact.tr,
                      onTap: () {},
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.grey,
                      ),
                    ),
                    CustomTileWidget(
                      leadingIcon: Iconsax.info_circle_copy,
                      title: lblVersion.tr,
                      trailing: const Text('1.0', textAlign: TextAlign.right),
                      onTap: () {},
                    ),
                    
                    // Logout Button
                    Obx(
                      () => controller.user.value == null? const SizedBox() : LogoutButtonWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void _showEditForm(BuildContext context) {
    final user = Get.find<UserProfileController>().user.value!;
    final nameController = TextEditingController(text: user.name);
    final emailController = TextEditingController(text: user.email);
    final genderController = TextEditingController(text: user.gender);
    final userTypeController = TextEditingController(text: user.userType);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Edit Profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildTextField('Name', nameController),
              _buildTextField('Email', emailController),
              _buildTextField('Gender', genderController),
              _buildTextField('User Type', userTypeController),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // تحديث البيانات في GetX Controller
                  controller.updateUser(
                    name: nameController.text,
                    email: emailController.text,
                    gender: genderController.text,
                    userType: userTypeController.text,
                  );
                  Get.back(); // إغلاق BottomSheet
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  void _showChangePasswordForm(BuildContext context) {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Change Password',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildTextField('Old Password', oldPasswordController),
              _buildTextField('New Password', newPasswordController),
              _buildTextField('Confirm Password', confirmPasswordController),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // تحديث البيانات في GetX Controller
                  controller.changePassword(
                    oldPassword: oldPasswordController.text,
                    newPassword: newPasswordController.text,
                    confirmPassword: confirmPasswordController.text,
                  );
                  Get.back(); // إغلاق BottomSheet
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        );
      },
    );
  }
}
