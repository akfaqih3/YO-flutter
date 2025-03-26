import 'package:get/get.dart';
import 'package:yemen_offers/features/profile/data/repos/user_profile_repo_empl.dart';
import 'package:yemen_offers/features/profile/domain/entities/user_entity.dart';
import 'package:yemen_offers/features/profile/domain/use_cases/user_profile_use_case.dart';

class UserProfileController extends GetxController {
  final UserProfileRepoImpl _userProfileRepo = Get.find<UserProfileRepoImpl>();
  final loading = false.obs;
  Rx<UserEntity?> user = Rx<UserEntity?>(null);

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    loading(true);
    final GetUserProfileUseCase getUserProfileUseCase = GetUserProfileUseCase(
      _userProfileRepo,
    );
    final result = await getUserProfileUseCase.execute();
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        user(right);
      },
    );
    loading(false);
  }

  Future<void> updateUser({
    required String name,
    required String email,
    required String gender,
    required String userType,
  }) async {
    loading(true);
    final UpdateUserProfileUseCase updateUserUseCase = UpdateUserProfileUseCase(
      _userProfileRepo,
    );
    final UserEntity userEntity = UserEntity(
      email: email,
      name: name,
      gender: gender,
      userType: userType,
    );
    final result = await updateUserUseCase.execute(userEntity);
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        Get.snackbar("Success", "تم تحديث البيانات بنجاح");
      },
    );
    loading(false);
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    loading(true);
    final ChangePasswordUseCase changePasswordUseCase = ChangePasswordUseCase(
      _userProfileRepo,
    );
    final result = await changePasswordUseCase.execute(
      oldPassword,
      newPassword,
      confirmPassword,
    );
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        Get.snackbar("Success", "تم تغيير كلمة المرور بنجاح");
      },
    );
    loading(false);
  }
}
