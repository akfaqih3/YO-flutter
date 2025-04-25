



import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';

class StoreTabWidget extends StatelessWidget {

  final List<StoreEntity> stores;
  final ScrollController scrollController;
  const StoreTabWidget({Key? key, required this.stores, required this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: scrollController,
        itemCount: stores.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(stores[index].name),
            subtitle: Text(stores[index].phone!),
            trailing: Image.network(
              stores[index].image!,
              width: 50,
              height: 50,
            ),
          );
        },
      ),
    );
  } 
  
}