import 'package:flutter/material.dart';
import 'package:yemen_offers/core/utils/map_util.dart';
import 'package:yemen_offers/features/store/domain/entities/store_etity.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_store_details_controller.dart';
import 'package:yemen_offers/features/store/presentation/widgets/store_map_widget.dart';

class StoreDetailsCardWidget extends StatelessWidget {
  final StoreEntity store;
  const StoreDetailsCardWidget({Key? key, required this.store})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Icon(Icons.store, color: Colors.blue.shade700),
              ),
              title: Text(
                store.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.phone, size: 18, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(
                        store.phone,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 18, color: Colors.grey),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          store.address ?? "بدون عنوان",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      if (store.latitude != null &&
                          store.longitude != null) // التأكد من وجود الإحداثيات
                        IconButton(
                          icon: Icon(Icons.map, color: Colors.blue),
                          onPressed:
                              () => {
                                MapUtil.openMap(
                                  double.parse(store.latitude!),
                                  double.parse(store.longitude!),
                                ),
                              },
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.white),
                  label: Text("تعديل"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.white),
                  label: Text("حذف"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // StoreMapWidget(
            //   storeLatitude: double.parse(store.latitude!),
            //   storeLongitude: double.parse(store.longitude!),
            // ),
          ],
        ),
      ),
    );
  }
}
