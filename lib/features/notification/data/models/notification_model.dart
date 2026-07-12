import 'package:yemen_offers/features/browse/data/models/offer_model.dart';

List<NotificationModel> NotificationModelsFromJson(dynamic json) =>
    List<NotificationModel>.from(
      json.map((x) => NotificationModel.fromJson(x)),
    );

class NotificationModel {
  final int id;
  final String? title;
  final String? body;
  final String? offer_slug;
  final String? offer_image;
  final String type;
  final bool isRead;
  final DateTime createdAt;

  NotificationModel({
    required this.id,
    this.title,
    this.body,
    this.offer_slug,
    this.offer_image,
    required this.type,
    required this.isRead,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        offer_slug: json["offer_slug"],
        offer_image: json['offer_image'],
        type: json["type"],
        isRead: json["is_read"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}
