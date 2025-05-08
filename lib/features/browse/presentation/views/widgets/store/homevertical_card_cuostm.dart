import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/store/verticl_card_coustm.dart';



class HoVerticalProductCardItems extends StatelessWidget {
  const HoVerticalProductCardItems({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> categories = [
      {"image": "Assets/promos/signUp_light.png", "title": "Zara", "description": "عروض حمايه لسيارتك بخصم حتئ 61%", "discount": "26", "price": "2600", "oldPrice": "2600", "rate": "3.5"},
      {"image": "Assets/logo/logo.jpg", "title": "Clothing", "discount": "50", "price": "1200", "oldPrice": "2600", "rate": "4.5"},
      {"image": "Assets/promos/login_light.png", "title": "Accessories", "discount": "25", "price": "3999", "oldPrice": "4000", "rate": "2.5"},
      {"image": "Assets/promos/notification.png", "title": "Electronics", "discount": "90", "price": "1700", "oldPrice": "5000", "rate": "5.0"},
      {"image": "Assets/promos/signUp_dark.png", "title": "Beauty", "discount": "26", "price": "2600", "oldPrice": "5600", "rate": "1.5"},
      {"image": "Assets/promos/login_dark.png", "title": "Home Decor", "discount": "75", "price": "8900", "oldPrice": "10000", "rate": "1.0"},
    ];

    return SizedBox(
      // height: 430,
      width: 400,// Adjusted height to fit the new structure
      child: HoVerticalProductsCard(
        items: categories, // Passing the list of categories
      ),
    );
  }
}