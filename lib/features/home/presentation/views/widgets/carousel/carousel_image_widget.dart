import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/home/domain/entities/recommendations_offer_entity.dart';

class CarouselImageWidget extends StatelessWidget {
  const CarouselImageWidget({
    super.key,
    this.height = 200,
    required this.width,
    required this.offer,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = Colors.white,
    this.fit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = 0,
  });

  final double? height;
  final double width;
  final RecommendationsOfferEntity offer;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          image: DecorationImage(
            image:
                isNetworkImage
                    ? NetworkImage(offer.image ?? "")
                    : AssetImage(offer.image ?? "") as ImageProvider,
            fit: fit,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(offer.title),
            Text(
              offer.discountPercentage.toString(),
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  AppRoutes.merchantOfferDetails,
                  arguments: offer.slug,
                );
              },
              child: Text("View Details"),
            ),
          ],
        ),
      ),
    );
  }
}
