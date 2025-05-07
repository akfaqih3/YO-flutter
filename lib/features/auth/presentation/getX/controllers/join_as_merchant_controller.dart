import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/auth/data/data_sources/register_remote_data_source.dart';
import 'package:yemen_offers/features/auth/data/repos/join_as_merchant_repo_impl.dart';
import 'package:yemen_offers/features/auth/data/repos/register_repo_impl.dart';
import 'package:yemen_offers/features/auth/domain/use_cases/join_as_merchant_use_case.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/categories_controller.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/home_controller.dart';

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

  final selectedCategory = "".obs;

  final Rx<File?> storeImage = Rx<File?>(null);

  bool _isLoading = false;

  final ImagePicker _imagePicker = ImagePicker();

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

    final JoinAsMerchantUseCase joinAsMerchantUseCase = JoinAsMerchantUseCase(
      _joinAsMerchantRepo,
    );

    final result = await joinAsMerchantUseCase.execute(
      phone: phoneController.text,
      address: addressController.text,
      storeName: storeNameController.text,
      storeDescription: storeDescriptionController.text,
      storeCategory: selectedCategory.value,
      storeImage: storeImage.value,
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
        print(merchant);
        Get.snackbar("success", "joined as merchant");
      },
    );
  }

  void pickImage() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      storeImage.value = File(pickedFile.path);
    }
  }
}
