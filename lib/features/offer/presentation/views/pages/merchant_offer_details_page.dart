import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/details/offer_date_section_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/details/offer_description_section_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/details/offer_price_section_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/details/offer_title_section_widget.dart';
import 'package:yemen_offers/features/offer/domain/entities/merchant_offer_entity.dart';
import 'package:yemen_offers/features/offer/presentation/getX/controllers/merchant_offer_details_controller.dart';

class MerchantOfferDetailsPage extends GetView<MerchantOfferDetailsController> {
  MerchantOfferDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final offer = controller.offer.value;
    if (offer == null) {
      return Scaffold(appBar: AppBar(title: Text("العرض غير متاح")));
    }
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              Card(
                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                elevation: 2,
                margin: EdgeInsets.all(0),
                child: Container(
                  height: 300,
                  child: Stack(
                    children: [
                      PageView(
                        children: [
                          Image.network(
                            offer.image!,
                            fit: BoxFit.fill,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    const Icon(Icons.image_not_supported),
                          ),
                        ],
                      ),
                     
                      Container(
                        // margin: EdgeInsets.only(top: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              // width: 300,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    20,
                                  ), // الزاوية العليا اليسرى
                                  topRight: Radius.circular(
                                    20,
                                  ), // الزاوية العليا اليمنى
                                ),
                              ),
                              child: Center(child: SizedBox()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20), // الزاوية العليا اليسرى
                          topRight: Radius.circular(
                            20,
                          ), // الزاوية العليا اليمنى
                        ),
                      ),
                      child: Center(child: SizedBox()),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(91, 158, 158, 158),
                        spreadRadius: 8,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                child: Column(
                  children: [
                    OfferTitleSectionWidget(
                      title: offer.title,
                      discountPercentage: offer.discountPercentage.toString(),
                    )
                    ,
                    OfferDescriptionSectionWidget(
                      description: offer.description ?? lblNoOffers.tr,
                      controller: controller,
                    )
                    ,
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: OfferPriceSectionWidget(
                          priceAfter: offer.priceAfter.toString(),
                          priceBefore: offer.priceBefore.toString(),
                      ),
                    ),
                    OfferDateSectionWidget(
                      startDate: DateTime.parse(offer.startDate ?? ""),
                      endDate: DateTime.parse(offer.endDate ?? ""),
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(91, 158, 158, 158),
                        spreadRadius: 8,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: const [
                              Text(
                                ' مرات الظهور:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '100',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            width: 2,
                            height: 40,
                            color: const Color(0xFFF45B01),
                          ),
                          Column(
                            children: const [
                              Text(
                                'عدد المشاهدة:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '30',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 15,
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 80,
                                  height: 2,
                                  color: const Color(0xFFF45B01),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'عدد مشاركه للعرض:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '12',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              width: 2,
                              height: 40,
                              color: const Color(0xFFF45B01),
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 80,
                                  height: 2,
                                  color: const Color(0xFFF45B01),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'عدد مفضله للعرض:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '5',
                                  style: TextStyle(fontWeight: FontWeight.bold),
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

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8),
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(vertical: 15),
              //     width: screenWidth,
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       boxShadow: const [
              //         BoxShadow(
              //           color: Color.fromARGB(91, 158, 158, 158),
              //           spreadRadius: 8,
              //           blurRadius: 10,
              //           offset: Offset(0, 2),
              //         ),
              //       ],
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         Column(
              //           children: const [
              //             Text(
              //               'عدد عمل مشاركه للعرض:',
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ),
              //             SizedBox(height: 5),
              //             Text('12',style: TextStyle(fontWeight: FontWeight.bold),),
              //           ],
              //         ),
              //         Container(
              //           width: 2,
              //           height: 40,
              //           color: const  Color(0xFFF45B01),
              //         ),
              //         Column(
              //           children: const [
              //             Text(
              //               'عدد عمل مفضله للعرض:',
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ),
              //             SizedBox(height: 5),
              //             Text('5',style: TextStyle(fontWeight: FontWeight.bold),),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),

          // أزرار أعلى الشاشة
          Positioned(
            top: 40,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.black45,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.black45,
              child: IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 80,
            child: CircleAvatar(
              backgroundColor: Colors.black45,
              child: IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFF45B01),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Text(
                  'تعديل',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFF45B01),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Text(
                  'حذف',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
