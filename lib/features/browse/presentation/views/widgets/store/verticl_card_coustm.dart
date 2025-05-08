import 'package:flutter/material.dart';

class HoVerticalProductsCard extends StatelessWidget {
  const HoVerticalProductsCard({
    super.key,
    required this.items,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
  });

  final List<Map<String, String>> items;
  final Color textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      reverse: false,
      child: Column(
        textDirection: TextDirection.rtl,
        children: items.map((item) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 15,right: 15),
              child: Container(
                width: 375,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),color: Colors.white,
                    // gradient: LinearGradient(
                    //   colors: [Colors.grey.shade200, Colors.grey.shade50],
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    // ),
                  ),
                  child: Stack(

                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                        child: Image.asset(
                          item['image']!,
                          fit: BoxFit.cover,
                          width: 375,
                          height: 140,
                        ),
                      ),
                      Positioned(
                        top: 98,
                        right: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            border: Border.all(color: Colors.grey, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.asset(
                              "Assets/logo/logo.jpg",
                              fit: BoxFit.cover,
                              width: 65,
                              height: 65,
                            ),
                          ),
                        ),
                      ),
                      if (item['discount'] != null && item['discount']!.isNotEmpty)
                        Positioned(
                          top: 10,
                          left: 13,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.redAccent.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Text(
                              '${item['discount']}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Khebrat Musamim',
                              ),
                            ),
                          ),
                        ),
                      Positioned(
                        top: 205,
                        left: 8,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(size: 25,
                            Icons.favorite_border,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        right: 80,
                        child: SizedBox(
                          width: 180,
                          child: Text(
                            item['title'] ?? 'لا يوجد عنوان',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade700,
                              fontFamily: 'Khebrat Musamim',
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 170,
                        right: 10,
                        child: SizedBox(
                          width: 300,
                          child: Text(
                            item['description'] ?? 'لا يوجد وصف',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Khebrat Musamim',
                              fontWeight: FontWeight.bold,

                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            if (item['price'] != null && item['price']!.isNotEmpty)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.deepOrange.withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Text(

                                  'ريال${item['price']} ',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Khebrat Musamim'                                  ),
                                ),
                              ),
                            const SizedBox(width: 5),
                            if (item['oldPrice'] != null && item['oldPrice']!.isNotEmpty)
                              Text(
                                '${item['oldPrice']}ريال',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough,
                                    fontFamily: 'Khebrat Musamim'                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
