import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/services/theme_service.dart';
import 'package:yemen_offers/features/profile/presentation/getX/controllers/user_profile_controller.dart';
import 'package:yemen_offers/features/profile/presentation/widgets/profile_logo_out_widget.dart';

class UserProfilePage extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              if (controller.user.value != null) {
                _showEditForm(context);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() {
              if (controller.loading.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (controller.user.value == null) {
                return Center(
                  child: Text(
                    'No User',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                );
              }

              final user = controller.user.value!;
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileItem('Name:', user.name),
                      _buildProfileItem('Email:', user.email),
                      _buildProfileItem('Gender:', user.gender),
                      _buildProfileItem('User Type:', user.userType),
                    ],
                  ),
                ),
              );
            }),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _showEditForm(context);
              },
              child: Text('Edit User'),
            ),
            ElevatedButton(
              onPressed: () {
                _showChangePasswordForm(context);
              },
              child: Text('Change Password'),
            ),
            SizedBox(height: 32),
            ProfileLogoOutWidget(),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Get.find<ThemeService>().toggleMode();
              },
              child: Text('toggle mode'),
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
