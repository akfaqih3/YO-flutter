import 'package:flutter/material.dart';
import 'package:yemen_offers/features/search/presentation/getX/controllers/search_controller.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, required this.controller});

  final SearchOffersController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller.searchKeywordController,
        decoration: InputDecoration(
          labelText: "Search",
          border: OutlineInputBorder(),
        ),
        onChanged: (value) => controller.searchOffersByKeyword(value),
      ),
    );
  }
}