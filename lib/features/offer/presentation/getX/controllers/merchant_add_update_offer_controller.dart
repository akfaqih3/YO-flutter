import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/offer_list_controller.dart';
import 'package:yemen_offers/features/offer/data/repos/offer_repo_impl.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/offer/data/sources/offer_remote_data_source.dart';
import 'package:yemen_offers/features/offer/domain/entities/merchant_offer_entity.dart';
import 'package:yemen_offers/features/offer/domain/use_cases/get_offer_category_by_categories_use_case.dart';
import 'package:yemen_offers/features/offer/domain/use_cases/merchant_add_offer_use_case.dart';
import 'package:yemen_offers/features/offer/domain/use_cases/merchant_update_offer_use_case.dart';
import 'package:yemen_offers/features/store/domain/entities/merchant_store_etity.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_store_details_controller.dart';

class MerchantAddUpdateOfferController extends GetxController {
  final OfferRepoImpl _offerRepoImpl = OfferRepoImpl(
    OfferRemoteDataSourceImpl(Get.find<ApiService>()),
  );

  Rx<List<OfferCategoryEntity>> offerCategories = Rx<List<OfferCategoryEntity>>(
    [],
  );
  RxString selectedOfferCategory = RxString("");
  Rx<MerchantOfferEntity?> offer = Rx<MerchantOfferEntity?>(null);
  Rx<MerchantStoreEtity?> store = Rx<MerchantStoreEtity?>(null);

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  final imageFile = Rx<File?>(null);
  final priceBeforeController = TextEditingController();
  final priceAfterController = TextEditingController();
  final discountController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  RxBool isLoading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void updateStartDate(String value) {
    startDateController.text = value;
    update(); // يعيد بناء GetBuilder
  }

  @override
  void onInit() async {
    super.onInit();
    offer(Get.arguments['offer']);
    store(Get.arguments[ApiKeys.store]);
    await getOfferCategories();
  }

  Future<void> getOfferCategories() async {
    // if (Get.find<OfferListController>().offerCategories.value.isNotEmpty) {
    //   offerCategories.value =
    //       Get.find<OfferListController>().offerCategories.value;
    //   return;
    // }
    final GetOfferCategoryByCategoriesUseCase
    getOfferCategoryByCategoriesUseCase = GetOfferCategoryByCategoriesUseCase(
      _offerRepoImpl,
    );
    final result = await getOfferCategoryByCategoriesUseCase.execute(
      store.value!.category.slug,
    );

    result.fold(
      (left) {
        Get.snackbar("خطاء", left.message.toString());
      },
      (right) {
        offerCategories(right);
      },
    );
  }

  void addOffer() async {
    isLoading(true);
    if (store.value == null) {
      Get.snackbar("خطاء", "لم تقم بإختيار   متجر");
      return;
    }

    if (formKey.currentState!.validate()) {
      final MerchantAddOfferUseCase merchantAddOfferUseCase =
          MerchantAddOfferUseCase(_offerRepoImpl);
      final result = await merchantAddOfferUseCase.execute(
        store.value!.slug!,
        title: titleController.value.text,
        description: descriptionController.value.text,
        category: selectedOfferCategory.value,
        image: imageFile.value,
        priceBefore: double.tryParse(priceBeforeController.value.text),
        priceAfter: double.tryParse(priceAfterController.value.text),
        startDate: startDateController.value.text,
        endDate: endDateController.value.text,
      );

      result.fold(
        (left) {
          Get.snackbar("خطاء", left.message.toString());
        },
        (right) {
          Get.back();
        },
      );
    }
    Get.find<MerchantStoreDetailsController>().getOffers();
    isLoading(false);
  }

  void updateOffer() async {
    isLoading(true);
    if (offer.value == null || store.value == null) {
      Get.snackbar("خطاء", "لم تقم بإختيار عرض أو متجر");
      return;
    }
    if (formKey.currentState!.validate()) {
      final MerchantUpdateOfferUseCase merchantUpdateOfferUseCase =
          MerchantUpdateOfferUseCase(_offerRepoImpl);
      final result = await merchantUpdateOfferUseCase.execute(
        store.value!.slug!,
        offer.value!.slug!,
        title: titleController.value.text,
        description: descriptionController.value.text,
        category: selectedOfferCategory.value,
        image: imageFile.value,
        priceBefore: double.tryParse(priceBeforeController.value.text),
        priceAfter: double.tryParse(priceAfterController.value.text),
        startDate: startDateController.value.text,
        endDate: endDateController.value.text,
      );

      result.fold(
        (left) {
          Get.snackbar("خطاء", left.message.toString());
        },
        (right) {
          Get.back();
        },
      );
    }
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
          imageFile.value = File(pickedFile.path);
        }
      }
    });
  }
}
