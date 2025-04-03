import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';

class CategoryImageWidget extends StatelessWidget {
  const CategoryImageWidget({
    super.key,
    required this.categories,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
  });

  final List<CategoryEntity> categories;
  final Color textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            categories.map((category) {
              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    width: 88,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.orange),
                    ),
                    child: Stack(
                      children: [
                        // Background image
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          child: Image.network(
                            category.image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Product title
                        Positioned(
                          bottom: 8,
                          child: SizedBox(
                            width: 120,
                            child: Text(
                              category.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              
                                fontStyle: FontStyle.italic,
                              ),

                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
