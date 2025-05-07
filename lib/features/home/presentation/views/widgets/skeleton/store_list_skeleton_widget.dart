// import 'package:flutter/material.dart';
// import 'package:yemen_offers/core/presentation/widgets/store_circle_item_widget.dart';

// class StoreListSkeletonWidget extends StatelessWidget {
//   const StoreListSkeletonWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         spacing: 16,
//         children: List.generate(5, (index) {
//           return StoreCircleItemWidget(
//             store: StoreEntity(
//               name: "store name",
//               description: "store description",
//               category: "store category",
//               image: "https://picsum.photos/200/300",
//               phone: "phone",
//               website: "website",
//               address: "address",
//               longitude: 0,
//               latitude: 0,
//               socialMedia: {},
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }