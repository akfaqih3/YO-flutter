import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/favorite/presentation/getX/controllers/favorite_controller.dart';

class FavoritePage extends GetView<FavoriteController> {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final _favorites = controller.favorites.value;

          return ListView.builder(
            itemCount: _favorites.length,
            itemBuilder: (context, index) {
              final favorite = _favorites[index];
              return ListTile(
                title: Text(favorite.title),
                subtitle: Text(favorite.description,maxLines: 2,),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(favorite.image),
                ),
                trailing: IconButton(
                  onPressed: () => FavoriteController.removeOffer(favorite.id),
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
