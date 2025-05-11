import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/notification/domain/entities/notification_entity.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({super.key, required this.notification});

  final NotificationEntity notification;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      reverse: false,
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: Container(
              width: 375,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Get.theme.shadowColor,
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
                color: Get.theme.scaffoldBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  width: 300,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    // color: Colors.blueAccent,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
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
                            child: Image.network(
                              notification.offer_image ?? "",
                              fit: BoxFit.cover,
                              width: 100,
                              height: 108,
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 70,
                        left: 8,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            size: 25,
                            Icons.favorite_border,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 7,
                        right: 130,
                        child: SizedBox(
                          width: 180,
                          child: Text(
                            notification.title ?? "",
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
                        top: 30,
                        right: 120,
                        child: SizedBox(
                          width: 300,
                          child: Text(
                            notification.body ?? "",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Khebrat Musamim',
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
