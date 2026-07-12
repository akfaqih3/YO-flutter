import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/notification/data/models/notification_model.dart';

List<NotificationEntity> notificationEntitiesFromModels(
  List<NotificationModel> notifications,
) {
  return notifications
      .map((notification) => NotificationEntity.fromModel(notification))
      .toList();
}

class NotificationEntity {
  final int id;
  final String? title;
  final String? body;
  final String? offer_slug;
  final String? offer_image;
  final String type;
  final bool isRead;
  final DateTime createdAt;

  NotificationEntity({
    required this.id,
    this.title,
    this.body,
    this.offer_slug,
    required this.offer_image,
    required this.type,
    required this.isRead,
    required this.createdAt,
  });

  factory NotificationEntity.fromModel(NotificationModel notificationModel) =>
      NotificationEntity(
        id: notificationModel.id,
        title: notificationModel.title,
        body: notificationModel.body,
        offer_slug: notificationModel.offer_slug,
        offer_image: notificationModel.offer_image,
        type: notificationModel.type,
        isRead: notificationModel.isRead,
        createdAt: notificationModel.createdAt,
      );
}
