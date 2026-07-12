import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/notification/domain/entities/notification_entity.dart';
import 'package:yemen_offers/features/notification/presentation/getX/controllers/notification_controller.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({super.key, required this.notification});

  final NotificationEntity notification;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => Get.find<NotificationController>().openNotification(notification.id),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              width: MediaQuery.of(context).size.width - 32,
              height: 130,
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
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    // color: Colors.blueAccent,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Get.theme.shadowColor,
                                spreadRadius: 1,
                                blurRadius: 4,
                              ),
                            ],
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
                            Iconsax.notification,
                            color:
                                notification.isRead
                                    ? AppColors.grey
                                    : AppColors.primary,
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
                              fontSize: 16,
                              // color: AppColors.black,
                              fontWeight: FontWeight.bold,
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
                            style: TextStyle(fontSize: 16),
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
