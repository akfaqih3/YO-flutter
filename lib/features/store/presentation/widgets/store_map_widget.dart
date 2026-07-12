import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:yemen_offers/core/services/location_service.dart';

class StoreMapWidget extends StatefulWidget {
  final double storeLatitude;
  final double storeLongitude;

  const StoreMapWidget({
    Key? key,
    required this.storeLatitude,
    required this.storeLongitude,
  }) : super(key: key);

  @override
  _StoreMapWidgetState createState() => _StoreMapWidgetState();
}

class _StoreMapWidgetState extends State<StoreMapWidget> {
  LatLng? userLocation;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    final locationService = Get.find<LocationService>();
    final longitude = await locationService.longitude;
    final latitude = await locationService.latitude;

    if (longitude != null && latitude != null) {
      setState(() {
        userLocation = LatLng(latitude.value, longitude.value);
      });
    }
  }
  // if (position != null) {
  //   setState(() {
  //     userLocation = LatLng(position.latitude, position.longitude);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        height: 300,
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(widget.storeLatitude, widget.storeLongitude),
            initialZoom: 14.0,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: 50.0,
                  height: 50.0,
                  point: LatLng(widget.storeLatitude, widget.storeLongitude),
                  child: const Icon(Icons.store, color: Colors.blue, size: 40),
                ),
                if (userLocation != null)
                  Marker(
                    width: 50.0,
                    height: 50.0,
                    point: userLocation!,
                    child: const Icon(
                      Icons.person_pin_circle,
                      color: Colors.green,
                      size: 40,
                    ),
                  ),
              ],
            ),
            if (userLocation != null)
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [
                      userLocation!,
                      LatLng(widget.storeLatitude, widget.storeLongitude),
                    ],
                    color: Colors.red,
                    strokeWidth: 4.0,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
