import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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

  final TextEditingController searchKeywordController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await searchOffersByKeyword("");
  }

  Future<void> searchOffersByKeyword(String searchKeyword) async {
    isloading(true);
    final SearchOffersByKeyWordUseCase searchOffersByKeyWordUseCase =
        SearchOffersByKeyWordUseCase(_searchRepo);
    final result = await searchOffersByKeyWordUseCase.execute(searchKeyword);
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

  Future<void> searchOffersByImage(File image) async {
    isloading(true);
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
    isloading(false);
  }
}
