import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/store/domain/entities/store_etity.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_stores_controller.dart';

class StoreItem extends StatelessWidget {
  final StoreEntity store;
  final MerchantStoresController controller;

  const StoreItem({Key? key, required this.store, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.merchantStoreDetails, arguments: store);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              // خلفية الصورة مع تدرج لوني
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.6),
                      ],
                    ),
                  ),
                ),
              ),
              // محتوى النصوص والأزرار
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      store.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.phone, size: 16, color: Colors.white70),
                        SizedBox(width: 5),
                        Text(
                          store.phone,
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.white70,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            store.address ?? "بدون عنوان",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => controller.updateStore(store),
                          icon: Icon(Icons.edit, color: Colors.white),
                          label: Text("تعديل"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _showDeleteAlert(context),
                          icon: Icon(Icons.delete, color: Colors.white),
                          label: Text("حذف"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("حذف المتجر"),
          content: Text("هل أنت متأكد من حذف المتجر؟"),
          actions: [
            TextButton(onPressed: () => Get.back(), child: Text("لا")),
            TextButton(
              onPressed: () {
                controller.deleteStore(store.slug!);
                Get.back();
              },
              child: Text("نعم"),
            ),
          ],
        );
      },
    );
  }
}
