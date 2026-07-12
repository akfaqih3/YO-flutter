import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:yemen_offers/core/common/presentation/widgets/map_store_marker_widget.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/location_service.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/repos/store_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/sources/browse_remote_data_source.dart';
import 'package:yemen_offers/features/browse/data/sources/store_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offers_by_store_use_case.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/store/get_nearby_store_use_case.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/store/store_marker_popup_widget.dart';

class StoreListNearbyController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  late StoreRepoImpl _storeRepoImpl;
  final LocationService _locationService = Get.find<LocationService>();

  final RxList<StoreEntity> stores = RxList([]);
  final RxList<OfferEntity> offers = RxList([]);
  final RxDouble radius = 5.0.obs;

  final Rx<StoreEntity?> selectedStore = Rx<StoreEntity?>(null);

  final Rx<MapControllerImpl> mapController = Rx(MapControllerImpl());
  final RxBool isStoresleading = true.obs;
  final RxBool isOffersleading = true.obs;
  final Rx<LatLng> userLocation = Rx(LatLng(0.0, 0.0));
  final Rx<Marker?> userMarker = Rx<Marker?>(null);
  final RxList<Marker> storeMarkers = RxList([]);
  final PopupController popupController = PopupController();


  @override
  void onInit() async {
    super.onInit();
    _initRepoImpl();
    checkLocation();
    intiUserMarker();
    await getStores();
    await getOffers();
    // zoomToIncludeAllStores();
  }

  void _initRepoImpl() {
    _storeRepoImpl = StoreRepoImpl(StoreRemoteDataSourceImpl(_apiService));
  }

  void getUserLocation() {
    userLocation(
      LatLng(_locationService.latitude.value, _locationService.longitude.value),
    );
  }

  void checkLocation() async {
    if (_locationService.latitude.value == 0.0 ||
        _locationService.longitude.value == 0.0) {
      await _locationService.getCurrentLocation();
    }
    getUserLocation();
  }

  Future<void> getStores() async {
    isStoresleading(true);
    checkLocation();
    final GetNearbyStoreUseCase getNearbyStoreUseCase = GetNearbyStoreUseCase(
      _storeRepoImpl,
    );

    final result = await getNearbyStoreUseCase.execute(
      radius: radius.value,
      latitude: _locationService.latitude.value,
      longitude: _locationService.longitude.value,
    );

    result.fold(
      (failure) {
        Get.snackbar("error", failure.message);
      },
      (success) {
        stores.assignAll(success);
      },
    );
    getStoreMarkers();
    isStoresleading(false);
  }

  Future<void> getOffers() async {
    isOffersleading(true);
    final GetOffersByStoreUseCase getOffersByStoreUseCase =
        GetOffersByStoreUseCase(
          BrowseRepoImpl(BrowseRemoteDataSourceImpl(_apiService)),
        );

    final result = await getOffersByStoreUseCase.execute(
      selectedStore.value != null
          ? selectedStore.value!.slug
          : stores.value.first.slug,
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

  void intiUserMarker() {
    userMarker(
      Marker(
        point: userLocation.value,
        width: 50,
        height: 50,
        child: const Icon(
          Icons.person_pin_circle,
          color: AppColors.primary,
          size: 40,
        ),
      ),
    );
  }

  void selectStore(StoreEntity store) async {
    selectedStore(store);
    await getOffers();
  }

  void getStoreMarkers() {
    final List<Marker> markers = [];
    stores.value.forEach((store) {
      markers.add(
        Marker(
          point: LatLng(
            double.parse(store.latitude.toString()),
            double.parse(store.longitude.toString()),
          ),
          width: 150,
          height: 150,
          child: GestureDetector(
            child: MapStoreMarkerWidget(store: store),
            onTap: () {
              selectStore(store);

              popupController.showPopupsOnlyFor([
                Marker(
                  point: LatLng(
                    double.parse(store.latitude ?? '0.0'),
                    double.parse(store.longitude ?? '0.0'),
                  ),
                  width: 80,
                  height: 80,
                  child: StoreMarkerPopupWidget(store: store),
                ),
              ]);
            },
          ),
        ),
      );
    });
    storeMarkers(markers);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void zoomToIncludeAllStores() {
    if (stores.isEmpty) return;

    double minLat = double.maxFinite;
    double maxLat = -double.maxFinite;
    double minLng = double.maxFinite;
    double maxLng = -double.maxFinite;

    for (var store in stores) {
      double lat = double.tryParse(store.latitude ?? '') ?? 0.0;
      double lng = double.tryParse(store.longitude ?? '') ?? 0.0;

      if (lat < minLat) minLat = lat;
      if (lat > maxLat) maxLat = lat;
      if (lng < minLng) minLng = lng;
      if (lng > maxLng) maxLng = lng;
    }

    LatLngBounds bounds = LatLngBounds(
      LatLng(minLat, minLng),
      LatLng(maxLat, maxLng),
    );

    mapController.value.fitCamera(
      CameraFit.bounds(
        bounds: bounds,
        padding: const EdgeInsets.all(50),
        maxZoom: 16,
      ),
    );
  }
}
