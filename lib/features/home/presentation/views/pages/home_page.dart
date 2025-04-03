import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/home_controller.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/home_header_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/carousel/carousel_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/home_body_widget.dart';
class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendationsOffer = controller.recommendationsOffers;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                ),
                Obx(() => CarouselWidget(offers: recommendationsOffer.value)),
                Positioned(top: 32, left: 8, right: 8, child: HomeHeaderWidget(controller: controller,)),
                Positioned(
                  bottom: 80,
                  child: Container(
                    padding: const EdgeInsets.only(left: 8,top: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 380,
                    child: HomeBodyWidget(controller: controller),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
