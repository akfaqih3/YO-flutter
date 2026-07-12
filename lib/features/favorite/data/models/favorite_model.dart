import 'package:yemen_offers/features/browse/data/models/offer_model.dart';

List<FavoriteModel> FavoriteModelFromJson(dynamic json) =>
    List<FavoriteModel>.from(json.map((x) => FavoriteModel.fromJson(x)));


class FavoriteModel {
  final int id;
  final OfferModel offer;
  final DateTime createdAt;

  FavoriteModel({
    required this.id,
    required this.offer,
    required this.createdAt,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
    id: json["id"],
    offer: OfferModel.fromJson(json["offer"]),
    createdAt: DateTime.parse(json["created_at"]),
  );
}
