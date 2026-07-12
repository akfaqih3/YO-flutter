import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/constants/app_enums.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/search/data/offers_response_model.dart';
import 'package:yemen_offers/features/search/data/repos/search_repo_impl.dart';
import 'package:yemen_offers/features/search/data/sources/search_remote_data_source.dart';
import 'package:yemen_offers/features/search/domain/entities/offers_response_entity.dart';
import 'package:yemen_offers/features/search/domain/use_cases/search_offers_by_image_use_case.dart';
import 'package:yemen_offers/features/search/domain/use_cases/search_offers_by_key_word_use_case.dart';

class SearchOffersController extends GetxController {
  final SearchRepoImpl _searchRepo = SearchRepoImpl(
    SearchRemoteDataSourceImpl(Get.find<ApiService>()),
  );
  final isloading = false.obs;

  Rx<OffersResponseEntity?> offersResponseEntity = Rx<OffersResponseEntity?>(
    null,
  );
  Rx<List<OfferEntity>> offers = Rx<List<OfferEntity>>([]);
  RxInt count = 0.obs;
  Rx<String?> next = Rx<String?>(null);
  Rx<String?> previous = Rx<String?>(null);

  final Rx<SearchOffersType> searchType = SearchOffersType.vector.obs;

  final TextEditingController searchKeywordController = TextEditingController();
  final Rx<File?> searchImage = Rx<File?>(null);

  final ImagePicker _imagePicker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    searchType(Get.arguments[ApiKeys.searchParam] ?? SearchOffersType.vector);
    // getOffers();
  }

  void pickImage() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      searchImage.value = File(pickedFile.path);
    }
  }

  void search() {
    switch (searchType.value) {
      case SearchOffersType.vector:
        searchOffersByKeyword();
        break;
      case SearchOffersType.image:
        searchOffersByImage();
        break;
    }
  }

  Future<void> searchOffersByKeyword() async {
    isloading(true);
    final SearchOffersByKeyWordUseCase searchOffersByKeyWordUseCase =
        SearchOffersByKeyWordUseCase(_searchRepo);
    final result = await searchOffersByKeyWordUseCase.execute(
      searchKeywordController.text,
    );
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        offersResponseEntity(right);
        offers(right.results);
        count(right.count);
        next(right.next);
        previous(right.previous);
      },
    );
    isloading(false);
  }

  Future<void> searchOffersByImage() async {
    if (searchImage.value == null) {
      Get.snackbar("Error", "Please enter a valid image");
      return;
    } else {
      isloading(true);
      final SearchOffersByImageUseCase searchOffersByImageUseCase =
          SearchOffersByImageUseCase(_searchRepo);
      final result = await searchOffersByImageUseCase.execute(
        searchImage.value!,
      );
      result.fold(
        (left) {
          Get.snackbar("Error", left.message);
        },
        (right) {
          offersResponseEntity(right);
          offers(right.results);
          count(right.count);
          next(right.next);
          previous(right.previous);
        },
      );
    }
    isloading(false);
  }
}
