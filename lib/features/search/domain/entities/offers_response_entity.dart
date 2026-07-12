

import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/search/data/offers_response_model.dart';

class OffersResponseEntity {
  int count;
  String? next;
  String? previous;
  List<OfferEntity> results;

  OffersResponseEntity({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory OffersResponseEntity.fromJson(Map<String, dynamic> json) =>
      OffersResponseEntity(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: offerEntityFromModel(json["results"]),
      );

  factory OffersResponseEntity.fromModel(OffersResponseModel model) =>
      OffersResponseEntity(
        count: model.count,
        next: model.next,
        previous: model.previous,
        results: offerEntityFromModel(model.results),
      );


}