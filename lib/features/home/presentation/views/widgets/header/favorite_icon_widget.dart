import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/favorite/domain/entities/favorite_entity.dart';

class FavoriteIconWidget extends StatelessWidget {
  FavoriteIconWidget({super.key, required this.favorites});
  final List<FavoriteEntity> favorites;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.favorite, size: 36, color: Colors.white),
          onPressed: () {
            Get.toNamed(AppRoutes.favorites);
          },
        ),
        if (favorites.isNotEmpty)
          Positioned(
            right: 5,
            top: 5,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(minWidth: 20, minHeight: 20),
              child: Text(
                favorites.length.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
