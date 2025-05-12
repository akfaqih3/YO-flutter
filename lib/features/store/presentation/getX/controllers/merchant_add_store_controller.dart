import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/categories_controller.dart';
import 'package:yemen_offers/features/store/data/repos/store_repo_impl.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/store/data/sources/store_remote_data_source.dart';
import 'package:yemen_offers/features/store/domain/entities/merchant_store_etity.dart';
import 'package:yemen_offers/features/store/domain/use_cases/add_store_use_case.dart';
import 'package:yemen_offers/features/store/domain/use_cases/update_store_use_case.dart';

class MerchantAddStoreController extends GetxController {
  final StoreRepoImpl _storeRepoImpl = StoreRepoImpl(
    StoreRemoteDataSourceImpl(Get.find<ApiService>()),
  );
  final CategoriesController categoriesController =
      Get.find<CategoriesController>();

  RxList<CategoryEntity> categories = RxList<CategoryEntity>();

  final Rx<MerchantStoreEtity?> storeToUpdate = Rx<MerchantStoreEtity?>(null);

  Rx<double> latitude = 0.0.obs;
  Rx<double> longitude = 0.0.obs;

  RxBool isLoading = false.obs;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final selectedCategory = "".obs;
  final imageFile = Rx<File?>(null);
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();
  final addressController = TextEditingController();
  final facebookController = TextEditingController();
  final instagramController = TextEditingController();
  final snapchatController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await getCategories();
    storeToUpdate(Get.arguments[ApiKeys.store]);
    initForm();
  }

  void initForm() {
    if (storeToUpdate.value != null) {
      nameController.text = storeToUpdate.value!.name;
      descriptionController.text = storeToUpdate.value!.description ?? "";
      selectedCategory(storeToUpdate.value!.category.slug);
      phoneController.text = storeToUpdate.value!.phone;
      websiteController.text = storeToUpdate.value!.website ?? "";
      addressController.text = storeToUpdate.value!.address ?? "";
      facebookController.text =
          storeToUpdate.value!.socialMedia?.facebook ?? "";
      instagramController.text =
          storeToUpdate.value!.socialMedia?.instagram ?? "";
      snapchatController.text =
          storeToUpdate.value!.socialMedia?.snapchat ?? "";

      if (storeToUpdate.value!.image != null) {
        imageFile.value = File.fromUri(Uri.parse(storeToUpdate.value!.image!));
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getCategories() async {
    final result = await categoriesController.getCategories();
    categories(result);
  }

  void addStore() async {
    isLoading(true);
    final AddStoreUseCase addStoreUseCase = AddStoreUseCase(_storeRepoImpl);
    final Map<String, String> socialMedia = {};
    if (facebookController.value.text.isNotEmpty) {
      socialMedia["facebook"] = facebookController.value.text;
    }
    if (instagramController.value.text.isNotEmpty) {
      socialMedia["instagram"] = instagramController.value.text;
    }
    if (snapchatController.value.text.isNotEmpty) {
      socialMedia["snapchat"] = snapchatController.value.text;
    }

    final result = await addStoreUseCase.execute(
      name: nameController.value.text,
      description: descriptionController.value.text,
      category: selectedCategory.value,
      image: imageFile.value,
      phone: phoneController.value.text,
      website: websiteController.value.text,
      address: addressController.value.text,
      longitude: 0.0,
      latitude: 0.0,
      socialMedia: socialMedia,
    );

    result.fold(
      (left) {
        Get.snackbar("خطاء", left.message.toString());
      },
      (right) {
        Get.back();
      },
    );
    isLoading(false);
  }

  void updateStore() async {
    isLoading(true);
    final UpdateStoreUseCase updateStoreUseCase = UpdateStoreUseCase(
      _storeRepoImpl,
    );
    final Map<String, String> socialMedia = {};
    if (facebookController.value.text.isNotEmpty) {
      socialMedia["facebook"] = facebookController.value.text;
    }
    if (instagramController.value.text.isNotEmpty) {
      socialMedia["instagram"] = instagramController.value.text;
    }

    if (snapchatController.value.text.isNotEmpty) {
      socialMedia["snapchat"] = snapchatController.value.text;
    }
    final result = await updateStoreUseCase.execute(
      slug: storeToUpdate.value!.slug!,
      name: nameController.value.text,
      description: descriptionController.value.text,
      category: selectedCategory.value,
      image: imageFile.value,
      phone: phoneController.value.text,
      website: websiteController.value.text,
      address: addressController.value.text,
      longitude: 0.0,
      latitude: 0.0,
      socialMedia: socialMedia,
    );

    result.fold(
      (left) {
        Get.snackbar("خطاء", left.message.toString());
      },
      (right) {
        Get.back();
      },
    );
    isLoading(false);
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
          imageFile.value = File(
            pickedFile.path,
          ); // تحديث Rx<File?> باستخدام .value
        }
      }
    });
  }
}
