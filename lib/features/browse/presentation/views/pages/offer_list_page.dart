import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/offer_list_controller.dart';

class OfferListPage extends GetView<OfferListController> {
  const OfferListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offers'),
      ),
      body: Center(
        child: Text('Offers'),
      ),
    );
  }
}