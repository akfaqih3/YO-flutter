import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:collection/collection.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/constants/app_enums.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/services/location_service.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/carousel/carousel_image_widget.dart';

class MapLayout extends StatefulWidget {
  final List<OfferEntity> offers;
  final double distanceKm;

  MapLayout({required this.offers, required this.distanceKm});

  @override
  _MapLayoutState createState() => _MapLayoutState();
}

class _MapLayoutState extends State<MapLayout> {
  final LocationService locationService = Get.find<LocationService>();
  late LatLng userLocation;
  final MapController _mapController = MapController();
  final PopupController _popupController = PopupController();
  StoreEntity? selectedStore;

  @override
  void initState() {
    super.initState();
    userLocation = LatLng(
      locationService.latitude.value,
      locationService.longitude.value,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectedStore = null; // لإظهار العروض فورًا عند الدخول
      });
    });
  }

  List<StoreEntity> getDistinctStores() {
    final seen = <String>{};
    return widget.offers
        .map((e) => e.store)
        .where((store) => seen.add(store.slug.toString()))
        .toList();
  }

  List<OfferEntity> getOffersByStore(StoreEntity store) {
    return widget.offers
        .where((offer) => offer.store.slug == store.slug)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final distinctStores = getDistinctStores();

    final storeMarkers =
        distinctStores
            .map((store) {
              final lat = double.tryParse(store.latitude ?? '') ?? 0.0;
              final lng = double.tryParse(store.longitude ?? '') ?? 0.0;
              final distance = Distance().as(
                LengthUnit.Kilometer,
                userLocation,
                LatLng(lat, lng),
              );

              if (distance > widget.distanceKm) return null;

              return Marker(
                width: 60,
                height: 60,
                point: LatLng(lat, lng),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedStore = store;
                    });
                    _popupController.showPopupsOnlyFor([
                      Marker(
                        point: LatLng(lat, lng),
                        width: 60,
                        height: 60,
                        child: const SizedBox(),
                      ),
                    ]);
                  },
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(store.image ?? ''),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            margin: const EdgeInsets.only(top: 2, right: 2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              getOffersByStore(store).length.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 60,
                        child: Text(
                          store.name ?? '',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
            .whereType<Marker>()
            .toList();

    final userMarker = Marker(
      width: 50,
      height: 50,
      point: userLocation,
      child: const Icon(Icons.person_pin_circle, color: Colors.red, size: 40),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('العروض القريبة')),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: userLocation,
              initialZoom: 14,
              onTap: (tapPosition, point) {
                _popupController.hideAllPopups();
              },
            ),

            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.yourapp',
              ),

              MarkerLayer(markers: [userMarker, ...storeMarkers]),
              PopupMarkerLayer(
                options: PopupMarkerLayerOptions(
                  markers: storeMarkers,
                  popupController: _popupController,
                  markerTapBehavior: MarkerTapBehavior.togglePopup(),
                  popupDisplayOptions: PopupDisplayOptions(
                    builder: (context, marker) {
                      final store = distinctStores.firstWhereOrNull(
                        (s) =>
                            double.tryParse(s.latitude ?? '') ==
                                marker.point.latitude &&
                            double.tryParse(s.longitude ?? '') ==
                                marker.point.longitude,
                      );

                      if (store == null) return const SizedBox.shrink();

                      final offers = getOffersByStore(store);

                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SizedBox(
                          width: 250,
                          height: 120,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child:
                                    store.image != null
                                        ? Image.network(
                                          store.image!,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        )
                                        : Icon(
                                          Iconsax.shop_copy,
                                          size: 100,
                                          color: AppColors.primary.withAlpha(
                                            200,
                                          ),
                                        ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    store.name ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "${lblcategory.tr}:${Get.locale?.languageCode == 'ar' ? store.category.nameAr : store.category.name}",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    '${offers.length} عروض متوفرة',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedStore = store;
                                      });
                                      _popupController.hideAllPopups();
                                      Get.toNamed(
                                        AppRoutes.storeDetails,
                                        arguments: {ApiKeys.store: store},
                                      );
                                    },
                                    child: Text(
                                      btnViewDetails.tr,
                                      style: TextStyle(
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          if (selectedStore != null)
            Positioned(
              top: 8,
              left: 8,
              right: 8,
              child: SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemCount: getOffersByStore(selectedStore!).length,
                  itemBuilder: (context, index) {
                    final offer = getOffersByStore(selectedStore!)[index];
                    return SizedBox(
                      width: 250,
                      child: CarouselImageWidget(
                        width: 250,
                        offer: offer,
                        borderRadius: 16,
                      ),
                    );
                  },
                ),
              ),
            ),
          // 🔘 زر الرجوع لموقع المستخدم
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              heroTag: "goToUserLocation",
              backgroundColor: Colors.white,
              onPressed: () {
                _mapController.move(userLocation, 14);
              },
              child: const Icon(Icons.my_location, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
