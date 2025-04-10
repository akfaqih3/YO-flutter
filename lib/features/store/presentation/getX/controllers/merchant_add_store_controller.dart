import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/categories_controller.dart';
import 'package:yemen_offers/features/store/data/repos/store_repo_impl.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/store/domain/entities/merchant_store_etity.dart';
import 'package:yemen_offers/features/store/domain/use_cases/add_store_use_case.dart';
import 'package:yemen_offers/features/store/domain/use_cases/update_store_use_case.dart';

class MerchantAddStoreController extends GetxController {
  final StoreRepoImpl _storeRepoImpl = Get.find<StoreRepoImpl>();
  final CategoriesController categoriesController = Get.find<CategoriesController>();

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
  final twitterController = TextEditingController();
  final youtubeController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await getCategories();
    storeToUpdate(Get.arguments);
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<StoreRepoImpl>();
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
    if (twitterController.value.text.isNotEmpty) {
      socialMedia["twitter"] = twitterController.value.text;
    }
    if (youtubeController.value.text.isNotEmpty) {
      socialMedia["youtube"] = youtubeController.value.text;
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
    if (twitterController.value.text.isNotEmpty) {
      socialMedia["twitter"] = twitterController.value.text;
    }
    if (youtubeController.value.text.isNotEmpty) {
      socialMedia["youtube"] = youtubeController.value.text;
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
}
