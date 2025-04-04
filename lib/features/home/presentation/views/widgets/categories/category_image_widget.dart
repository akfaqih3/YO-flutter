import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';

class CategoryImageWidget extends StatelessWidget {
  const CategoryImageWidget({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        width: 88,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.deepOrange, width: 0.5),
          image: DecorationImage(
            image: NetworkImage(category.image!),
            fit: BoxFit.cover,
          ),
         
        ),
        child: Container(
          alignment: Alignment.bottomCenter,

          height: MediaQuery.of(context).size.height,
          child: Text(
            category.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,

              fontStyle: FontStyle.italic,
            ),

            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
