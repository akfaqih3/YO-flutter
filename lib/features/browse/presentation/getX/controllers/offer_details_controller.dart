import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/sources/browse_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offer_details_use_case.dart';
import 'package:yemen_offers/features/favorite/presentation/getX/controllers/favorite_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class OfferDetailsController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  late BrowseRepoImpl _browseRepoImpl;

  final FavoriteController favoriteController = Get.find<FavoriteController>();

  RxString offerSlug = RxString("");
  Rx<OfferEntity?> offer = Rx<OfferEntity?>(null);
  final RxBool isDescriptionExpanded = false.obs;
  final RxBool isOfferleading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    offerSlug(Get.arguments[ApiKeys.offerSlug] ?? "");
    _browseRepoImpl = BrowseRepoImpl(BrowseRemoteDataSourceImpl(_apiService));
    await getOfferDetails();
  }

  Future<void> getOfferDetails() async {
    isOfferleading(true);
    final GetOfferDetailsUseCase getOfferDetailsUseCase =
        GetOfferDetailsUseCase(_browseRepoImpl);

    final result = await getOfferDetailsUseCase.execute(offerSlug.value);
    result.fold(
      (failure) {
        Get.snackbar("error", failure.message);
      },
      (offerEntity) {
        offer(offerEntity);
      },
    );
    isOfferleading(false);
  }

  void toggleDescriptionExpanded() {
    isDescriptionExpanded.value = !isDescriptionExpanded.value;
  }

  void shareOfferUser(BuildContext context) async {
    if (offer.value != null) {
      openShareOffer(context);
      print("share");
      // await favoriteController.shareOfferUser(offer.value!.slug);
    }
  }

  Future<void> openShareOffer(BuildContext context) async {
    try {
      final box = context.findRenderObject() as RenderBox?;
      final Uri offerUri = Uri.parse(
        "http://yemeni-offers.com/api/core/offers/${offer.value!.slug}/",
      );
      final XFile? imageFile = await _getImageFromCache(offer.value!.image!);
      final ShareParams shareParams = ShareParams(
        title: 'Check out this offer!',
        uri: offerUri,
        previewThumbnail: imageFile,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );

      await SharePlus.instance.share(shareParams);
    } catch (e) {
      debugPrint('Error sharing: $e');
    }
  }

  Future<XFile?> _getImageFromCache(String imageUrl) async {
    try {
      final file = await DefaultCacheManager().getSingleFile(imageUrl);

      return XFile(file.path);
    } catch (e) {
      print('Error fetching image from cache: $e');
      return null;
    }
  }
}
