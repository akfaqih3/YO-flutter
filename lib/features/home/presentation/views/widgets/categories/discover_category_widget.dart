import 'package:flutter/material.dart';

class DiscoverCategoryWidget extends StatelessWidget {
  const DiscoverCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.deepOrange, width: 0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.map_sharp),
          Text("Nearby Offers"),
          ElevatedButton(onPressed: () {}, child: Text("discover")),
        ],
      ),
    );
  }
}
