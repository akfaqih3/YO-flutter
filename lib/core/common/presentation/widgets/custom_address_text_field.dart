import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/utils/map_util.dart';

class CustomAddressTextField extends StatelessWidget {
  const CustomAddressTextField({
    super.key,
    required this.addressTextEditingController,
    required this.latitude,
    required this.longitude,
  });

  final TextEditingController addressTextEditingController;
  final Rx<double> latitude;
  final Rx<double> longitude;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: addressTextEditingController,
        readOnly: true, 
        decoration: InputDecoration(
          labelText: "العنوان",
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(Icons.map, color: Colors.blue),
            onPressed:
                () => {
                  MapUtil.selectLocation(
                    addressController: addressTextEditingController,
                    latitude: latitude,
                    longitude: longitude,
                  ),
                },
          ),
        ),
      ),
    );
  }
}
