import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/home/domain/entities/recommendations_offer_entity.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/carousel_controller.dart';
import 'carousel_image_widget.dart';
import 'carousel_indicator_widget.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key, required this.offers});

  final List<OfferEntity> offers;

  @override
  Widget build(BuildContext context) {
    final AppCarouselController controller = Get.put(AppCarouselController());
    return Container(
      child: Stack(
        children: [
          CarouselSlider(
            items:
                offers
                    .map(
                      (offer) => CarouselImageWidget(
                        width: MediaQuery.of(context).size.width,
                        offer: offer,
                        isNetworkImage: true,
                      ),
                    )
                    .toList(),
            options: CarouselOptions(
              height: 256,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInOut,
              onPageChanged: (index, _) => controller.updatePageIndicator(index),
            ),
          ),
          SizedBox(height: 3),
          Positioned(
            bottom: 24,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Obx(() {
                final index = controller.carouselCurrentIndex.value;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < offers.length; i++)
                      CarouselIndicatorWidget(
                        width: index == i ? 10 : 6,
                        height: index == i ? 10 : 6,
                        backgroundColor:
                            index == i ? Colors.deepOrangeAccent : Colors.white,
                        margin: EdgeInsets.only(right: 10),
                       
                      ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
