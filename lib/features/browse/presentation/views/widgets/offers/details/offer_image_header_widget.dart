import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OfferImageHeaderWidget extends StatelessWidget {
  final String imageUrl;

  const OfferImageHeaderWidget({Key? key, required this.imageUrl})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child:
          imageUrl.isNotEmpty
              ? CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                // errorBuilder:
                //     (context, error, stackTrace) => const Center(
                //       child: Icon(
                //         Icons.image_not_supported,
                //         size: 50,
                //         color: Colors.grey,
                //       ),
                //     ),
              )
              : const Center(
                child: Icon(
                  Icons.image_not_supported,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
    );
  }
}
