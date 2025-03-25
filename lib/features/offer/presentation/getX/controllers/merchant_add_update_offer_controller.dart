import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:yemen_offers/features/offer/data/repos/offer_repo_impl.dart';
import 'package:yemen_offers/features/offer/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/offer/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/offer/domain/use_cases/get_offer_category_by_categories_use_case.dart';
import 'package:yemen_offers/features/offer/domain/use_cases/merchant_add_offer_use_case.dart';
import 'package:yemen_offers/features/offer/domain/use_cases/merchant_update_offer_use_case.dart';
import 'package:yemen_offers/features/store/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/store/domain/entities/store_etity.dart';

class MerchantAddUpdateOfferController extends GetxController {
  final OfferRepoImpl _offerRepoImpl = Get.find<OfferRepoImpl>();

  Rx<List<OfferCategoryEntity>> offerCategories = Rx<List<OfferCategoryEntity>>( []);
  RxString selectedOfferCategory = RxString("");
  Rx<OfferEntity?> offer = Rx<OfferEntity?>(null);
  Rx<StoreEntity?> store = Rx<StoreEntity?>(null);

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

  @override
  void onInit() async {
    super.onInit();
    offer(Get.arguments['offer']);
    store(Get.arguments['store']);
    getOfferCategories();
  }

  Future<void> getOfferCategories() async {
    final GetOfferCategoryByCategoriesUseCase
    getOfferCategoryByCategoriesUseCase = GetOfferCategoryByCategoriesUseCase(
      _offerRepoImpl,
    );
    final result = await getOfferCategoryByCategoriesUseCase.execute(
      store.value!.category,
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

  void chooseImage() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  void addOffer() async {
    isLoading(true);
    if (store.value == null) {
      Get.snackbar("خطاء", "لم تقم بإختيار   متجر");
      return;
    }

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
    isLoading(false);
  }

  void updateOffer() async {
    isLoading(true);
    if (offer.value == null || store.value == null) {
      Get.snackbar("خطاء", "لم تقم بإختيار عرض أو متجر");
      return;
    }
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
    isLoading(false);
  }
}
