import 'package:yemen_offers/features/browse/data/models/offer_model.dart';

List<NotificationModel> NotificationModelsFromJson(dynamic json) =>
    List<NotificationModel>.from(json.map((x) => NotificationModel.fromJson(x)));

class NotificationModel {
  final int id;
  final String? title;
  final String? body;
  final OfferModel offer;
  final String type;
  final bool isRead;
  final DateTime createdAt;

  NotificationModel({
    required this.id,
    this.title,
    this.body,
    required this.offer,
    required this.type,
    required this.isRead,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        offer: OfferModel.fromJson(json["offer"]),
        type: json["type"],
        isRead: json["is_read"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}