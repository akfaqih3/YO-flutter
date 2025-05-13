import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/store_list_nearby_controller.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/store/store_marker_popup_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/carousel/carousel_image_widget.dart';

class StoreListNearbyMapWidget extends StatelessWidget {
  final StoreListNearbyController controller;

  const StoreListNearbyMapWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: controller.mapController.value,
          options: MapOptions(
            initialCenter: controller.userLocation.value,
            // initialZoom: 14,
            onTap: (tapPosition, point) {
              controller.popupController.hideAllPopups();
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.yourapp',
            ),
            Obx(() {
              return controller.storeMarkers.value.isEmpty
                  ? MarkerLayer(
                    markers: [
                      const Marker(
                        point: LatLng(0, 0),
                        width: 50,
                        height: 50,
                        child: const Icon(
                          Icons.person_pin_circle,
                          color: AppColors.primary,
                          size: 40,
                        ),
                      ),
                    ],
                  )
                  : MarkerLayer(
                    markers: [
                      controller.userMarker.value!,
                      ...controller.storeMarkers.value,
                    ],
                  );
            }),

            CircleLayer(
              circles: [
                CircleMarker(
                  point: controller.userLocation.value,
                  color: AppColors.primary.withOpacity(0.2),
                  borderStrokeWidth: 2,
                  useRadiusInMeter: true,
                  radius:
                      controller.radius.value *
                      1000, // الشعاع بالكيلومتر * 1000
                  borderColor: AppColors.primary,
                ),
              ],
            ),

            PopupMarkerLayer(
              options: PopupMarkerLayerOptions(
                markers: controller.storeMarkers.value,
                popupController: controller.popupController,
                markerTapBehavior: MarkerTapBehavior.togglePopup(),
                popupDisplayOptions: PopupDisplayOptions(
                  builder: (context, marker) {
                    controller.selectedStore.value;
                    return marker.child;
                  },
                ),
              ),
            ),
          ],
        ),

        Obx(() {
          return controller.offers.value == null
              ? const SizedBox()
              : Positioned(
                top: 8,
                left: 8,
                right: 8,
                child: SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemCount: controller.offers.value.length,
                    itemBuilder: (context, index) {
                      final offer = controller.offers.value[index];
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
              );
        }),
        // 🔘 زر الرجوع لموقع المستخدم
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            heroTag: "goToUserLocation",
            backgroundColor: Colors.white,
            onPressed: () {
              controller.mapController.value.move(
                controller.userLocation.value,
                14,
              );
            },
            child: const Icon(Icons.my_location, color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
