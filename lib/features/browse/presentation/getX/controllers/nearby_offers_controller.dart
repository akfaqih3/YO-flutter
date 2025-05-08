import 'package:flutter/material.dart';
import 'package:get/get.dart ';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/core/services/location_service.dart';
import 'package:yemen_offers/features/browse/data/repos/offer_list_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/sources/offer_list_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offers_nearby_use_case.dart';

class NearbyOffersController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  final LocationService _locationService = Get.find<LocationService>();
  late OfferListRepoImpl _offerListRepoImpl;

  final RxList<OfferEntity> offers = RxList([]);
  final RxDouble distanceKM = 10.0.obs;

  final RxBool isOffersleading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    _initRepoImpl();
    await getOffers();
  }

  void checkLocation() async {
    if (_locationService.latitude.value == 0.0 ||
        _locationService.longitude.value == 0.0) {
      await _locationService.getCurrentLocation();
    }
  }

  void _initRepoImpl() {
    _offerListRepoImpl = OfferListRepoImpl(
      OfferListRemoteDataSourceImpl(_apiService),
    );
  }

  Future<void> getOffers() async {
    isOffersleading(true);
    checkLocation();
    final GetOffersNearbyUseCase getOffersNearbyUseCase =
        GetOffersNearbyUseCase(_offerListRepoImpl);

    final result = await getOffersNearbyUseCase.execute(
      distance_km: distanceKM.value,
      latitude: _locationService.latitude.value,
      longitude: _locationService.longitude.value,
    );

    result.fold(
      (failure) {
        Get.snackbar("error", failure.message);
      },
      (success) {
        offers.assignAll(success);
      },
    );
    isOffersleading(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
