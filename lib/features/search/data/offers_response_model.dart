import 'package:yemen_offers/features/browse/data/models/offer_model.dart';

///PaginatedOfferList
class OffersResponseModel {
  int count;
  String? next;
  String? previous;
  List<OfferModel> results;

  OffersResponseModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory OffersResponseModel.fromJson(Map<String, dynamic> json) =>
      OffersResponseModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: offersModelFromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}
