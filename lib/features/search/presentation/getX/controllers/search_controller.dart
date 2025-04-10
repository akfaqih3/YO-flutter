import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/search/data/repos/search_repo_impl.dart';
import 'package:yemen_offers/features/search/data/sources/search_remote_data_source.dart';
import 'package:yemen_offers/features/search/domain/use_cases/search_offers_by_image_use_case.dart';
import 'package:yemen_offers/features/search/domain/use_cases/search_offers_by_key_word_use_case.dart';

class SearchOffersController extends GetxController {
  final SearchRepoImpl _searchRepo = SearchRepoImpl(
    SearchRemoteDataSourceImpl(Get.find<ApiService>()),
  );
  final loading = false.obs;

  Rx<List<OfferEntity>> offers = Rx<List<OfferEntity>>([]);

  final TextEditingController searchKeywordController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await searchOffersByKeyword("");
  }

  Future<void> searchOffersByKeyword(String searchKeyword) async {
    loading(true);
    final SearchOffersByKeyWordUseCase searchOffersByKeyWordUseCase =
        SearchOffersByKeyWordUseCase(_searchRepo);
    final result = await searchOffersByKeyWordUseCase.execute(searchKeyword);
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        offers(right);
      },
    );
    loading(false);
  }

  Future<void> searchOffersByImage(File image) async {
    loading(true);
    final SearchOffersByImageUseCase searchOffersByImageUseCase =
        SearchOffersByImageUseCase(_searchRepo);
    final result = await searchOffersByImageUseCase.execute(image);
    result.fold(
      (left) {
        Get.snackbar("Error", left.message);
      },
      (right) {
        offers(right);
      },
    );
    loading(false);
  }
}
