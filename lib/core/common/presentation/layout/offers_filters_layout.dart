import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:yemen_offers/core/common/controllers/offers_filters_controller.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/offer_list_controller.dart';

class OffersFiltersLayout extends StatelessWidget {
  final OffersFiltersController controller;

  const OffersFiltersLayout({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.onInit();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('فلاتر العروض', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // تصنيفات المتاجر
            Obx(() => controller.categories.value.isEmpty
                ? SizedBox()
                : MultiSelectDialogField<String>(
                    items: controller.categories.value,
                    listType: MultiSelectListType.CHIP,
                    buttonText: Text('تصنيفات المتاجر'),
                    title: Text('اختر التصنيفات'),
                    onConfirm: (values){
                        controller.selectCategories(values);
                    },
                    initialValue: controller.selectedCategories.value,
                  )),
            const SizedBox(height: 12),

            // المتاجر
            Obx(() => controller.stores.value.isEmpty
                ? SizedBox()
                : MultiSelectDialogField<String>(
                    items: controller.stores.value,
                    listType: MultiSelectListType.CHIP,
                    buttonText: Text('المتاجر'),
                    title: Text('اختر المتاجر'),
                    onConfirm: controller.selectedStores,
                    initialValue: controller.selectedStores.value,
                  )),
            const SizedBox(height: 12),

            // تصنيفات العروض
            Obx(() => controller.offerCategories.value.isEmpty
                ? SizedBox()
                : MultiSelectDialogField<String>(
                    items: controller.offerCategories.value,
                    listType: MultiSelectListType.CHIP,
                    buttonText: Text('أنواع العروض'),
                    title: Text('اختر الأنواع'),
                    onConfirm: controller.selectedOfferCategories.assignAll,
                    initialValue: controller.selectedOfferCategories.value,
                  )),
            const SizedBox(height: 16),

            // فلتر السعر بعد الخصم
            Text('نطاق السعر بعد الخصم'),
            Obx(() => Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        initialValue: controller.priceRange.value.start.round().toString(),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'من'),
                        onChanged: (value) {
                          final double? newStart = double.tryParse(value);
                          if (newStart != null) {
                            controller.priceRange.value = RangeValues(newStart, controller.priceRange.value.end);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: TextFormField(
                        initialValue: controller.priceRange.value.end.round().toString(),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'إلى'),
                        onChanged: (value) {
                          final double? newEnd = double.tryParse(value);
                          if (newEnd != null) {
                            controller.priceRange.value = RangeValues(controller.priceRange.value.start, newEnd);
                          }
                        },
                      ),
                    ),
                  ],
                )),
            Obx(() => RangeSlider(
                  values: controller.priceRange.value,
                  min: 0,
                  max: 10000,
                  divisions: 100,
                  labels: RangeLabels(
                    controller.priceRange.value.start.round().toString(),
                    controller.priceRange.value.end.round().toString(),
                  ),
                  onChanged: (val) => controller.priceRange.value = val,
                )),
            const SizedBox(height: 16),

            // نسبة الخصم (مع إمكانية إدخال يدوي)
            Text('نسبة الخصم (أكبر من %)'),
            Obx(() => Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        initialValue: controller.discountMin.value.round().toString(),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'نسبة الخصم'),
                        onChanged: (value) {
                          final double? newVal = double.tryParse(value);
                          if (newVal != null) controller.discountMin.value = newVal;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text('${controller.discountMin.value.round()}%'),
                  ],
                )),
            Obx(() => Slider(
                  value: controller.discountMin.value,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: controller.discountMin.value.round().toString(),
                  onChanged: (val) => controller.discountMin.value = val,
                )),
            const SizedBox(height: 16),

            // تاريخ انتهاء العرض باستخدام DatePicker
            Text('تاريخ انتهاء العرض قبل'),
            Obx(() => InkWell(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: controller.endBeforeDate.value ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                    );
                    if (picked != null) controller.endBeforeDate.value = picked;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.date_range),
                        const SizedBox(width: 8),
                        Text(
                          controller.endBeforeDate.value == null
                              ? 'اختر التاريخ'
                              : DateFormat('yyyy-MM-dd').format(controller.endBeforeDate.value!),
                        ),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 24),

            // الأزرار
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('إلغاء'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.find<OfferListController>().getOffers();
                      Navigator.pop(context);
                    },
                    child: Text('تطبيق'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
