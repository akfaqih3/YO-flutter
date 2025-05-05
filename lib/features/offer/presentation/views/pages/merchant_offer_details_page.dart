import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/offer/presentation/getX/controllers/merchant_offer_details_controller.dart';

class MerchantOfferDetailsPage extends GetView<MerchantOfferDetailsController> {
  const MerchantOfferDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final offer = controller.offer.value;
    if (offer == null) {
      return Scaffold(appBar: AppBar(title: Text("العرض غير متاح")));
    }
    return Scaffold(
      appBar: AppBar(title: Text(offer.title), backgroundColor: Colors.orange),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة العرض
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  offer.image ?? "",
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Icon(Icons.image_not_supported),
                ),
              ),
              const SizedBox(height: 16),

              // عنوان العرض
              Text(
                offer.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // وصف العرض
              Text(
                offer.description ?? "",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                maxLines: 7,
              ),
              const SizedBox(height: 16),

              // الأسعار قبل وبعد الخصم
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (offer.priceBefore != null)
                    Text(
                      '${offer.priceBefore} ريال',
                      style: const TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                      ),
                    ),
                  Text(
                    '${offer.priceAfter} ريال',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '-${offer.discountPercentage}%',
                    style: const TextStyle(fontSize: 18, color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // التواريخ
              ListTile(
                leading: const Icon(Icons.date_range, color: Colors.orange),
                title: Text(
                  'من ${offer.startDate ?? "غير متاح"} إلى ${offer.endDate ?? "غير متاح"}',
                ),
              ),

              // حالة العرض
              ListTile(
                leading: Icon(
                  offer.isExpired == false ? Icons.check_circle : Icons.cancel,
                  color: offer.isExpired == false ? Colors.green : Colors.red,
                ),
                title: Text(
                  offer.isExpired == false ? "العرض متاح" : "العرض غير متاح",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: offer.isExpired == false ? Colors.green : Colors.red,
                  ),
                ),
              ),
              // bottons to update and delete 
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.updateOffer();
                    },
                    child: Text("تحديث العرض"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.deleteOffer();
                    },
                    child: Text("حذف العرض"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
