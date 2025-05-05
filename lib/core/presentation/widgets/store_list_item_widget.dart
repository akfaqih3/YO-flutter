import 'package:flutter/material.dart';

class StoreListItemWidget extends StatelessWidget {
  const StoreListItemWidget({
    super.key,
    required this.storeName,
    required this.storeDescription,
    required this.imageUrl,
  });

  final String storeName;
  final String storeDescription;
  final String imageUrl;

  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        leading: const Icon(Icons.arrow_back_ios), // RTL: back icon to the left
        title: Text(
          storeName,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
        subtitle: Text(
          storeDescription,
          style: const TextStyle(color: Colors.redAccent),
          textAlign: TextAlign.right,
        ),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.network(
            imageUrl,
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  
  
  }
}
