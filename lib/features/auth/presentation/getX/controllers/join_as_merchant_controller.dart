import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/auth/data/data_sources/register_remote_data_source.dart';
import 'package:yemen_offers/features/auth/data/repos/join_as_merchant_repo_impl.dart';
import 'package:yemen_offers/features/auth/data/repos/register_repo_impl.dart';
import 'package:yemen_offers/features/auth/domain/use_cases/join_as_merchant_use_case.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/categories_controller.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/home_controller.dart';
import 'package:yemen_offers/features/profile/presentation/getX/controllers/user_profile_controller.dart';

class JoinAsMerchantController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  late JoinAsMerchantRepoImpl _joinAsMerchantRepo;

  final CategoriesController categoriesController =
      Get.find<CategoriesController>();

  RxList<CategoryEntity> categories = RxList<CategoryEntity>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController storeDescriptionController =
      TextEditingController();
  final TextEditingController storePhoneController = TextEditingController();
  final TextEditingController storeWebsiteController = TextEditingController();
  final TextEditingController storeAddressController = TextEditingController();
  final TextEditingController facebookLinkController = TextEditingController();
  final TextEditingController instagramLinkController = TextEditingController();
  final TextEditingController snapchatLinkController = TextEditingController();

  final Rx<File?> imageFile = Rx<File?>(null);

  final selectedCategory = "".obs;

  // final Rx<File?> storeImage = Rx<File?>(null);

  RxBool _isLoading = false.obs;

  final ImagePicker _imagePicker = ImagePicker();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    initRepoImpl();
    super.onInit();

    await getCategories();
  }

  Future<void> getCategories() async {
    await Get.find<HomeController>().getCategories();
    await categories(Get.find<HomeController>().categories.value);
  }

  void initRepoImpl() {
    _joinAsMerchantRepo = JoinAsMerchantRepoImpl(
      registerRemoteDataSource: RegisterRemoteDataSourceImpl(_apiService),
    );
  }

  Future<void> joinAsMerchant() async {
    if (selectedCategory.value == null) {
      Get.snackbar("خطاء", "لم تقم بإختيار الفئة");
      return;
    }

    if (formKey.currentState!.validate()) {
      _isLoading(true);
      final JoinAsMerchantUseCase joinAsMerchantUseCase = JoinAsMerchantUseCase(
        _joinAsMerchantRepo,
      );

      final result = await joinAsMerchantUseCase.execute(
        phone: phoneController.text,
        address: addressController.text,
        storeName: storeNameController.text,
        storeDescription: storeDescriptionController.text,
        storeCategory: selectedCategory.value,
        storeImage: imageFile.value,
        storePhone: storePhoneController.text,
        storeWebsite: storeWebsiteController.text,
        storeAddress: storeAddressController.text,
        storeLongitude: 0,
        storeLatitude: 0,
        facebookLink: facebookLinkController.text.trim(),
        instagramLink: instagramLinkController.text.trim(),
        snapchatLink: snapchatLinkController.text.trim(),
      );

      result.fold(
        (failure) {
          Get.snackbar("error", failure.message);
        },
        (merchant) {
          Get.find<UserProfileController>().getProfile();
          Get.toNamed(AppRoutes.merchantStores);
        },
      );
    }
    _isLoading(false);
  }

  Future<void> pickImage() async {
    await showModalBottomSheet<ImageSource>(
      context: Get.context!, // استخدم Get.context إذا كنت تستخدم GetX
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Iconsax.camera,
                  color: AppColors.primary,
                  size: 32,
                ),
                title: Text(hntTakePhoto.tr),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(
                  Iconsax.image,
                  color: AppColors.primary,
                  size: 32,
                ),
                title: Text(hntChoosePhoto.tr),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    ).then((ImageSource? source) async {
      if (source != null) {
        final pickedFile = await ImagePicker().pickImage(source: source);
        if (pickedFile != null) {
          imageFile.value = File(pickedFile.path);
        }
      }
    });
  }
}
