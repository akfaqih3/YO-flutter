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
    body: RefreshIndicator(
      onRefresh: () async {
        await controller.refreshPage();
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 240,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Obx(() => CarouselWidget(offers: recommendationsOffer.value)),
            ),
          ),
          SliverToBoxAdapter(
            child: HomeBodyWidget(controller: controller),
          ),
        ],
      ),
    ),
  );
}

}