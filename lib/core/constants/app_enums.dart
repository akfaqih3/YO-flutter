enum OfferListType { latest, mostPopular, nearby }

Map<OfferListType, String> offerListTypeToString = {
  OfferListType.latest: 'latest',
  OfferListType.mostPopular: 'popular',
  OfferListType.nearby: 'nearby',
};

enum OfferListOrderBy { startDate, end_date, priceBefore, priceAfter, discount }

Map<OfferListOrderBy, String> offerListOrderByToString = {
  OfferListOrderBy.startDate: 'start_date',
  OfferListOrderBy.end_date: 'end_date',
  OfferListOrderBy.priceBefore: 'price_before',
  OfferListOrderBy.priceAfter: 'price_after',
  OfferListOrderBy.discount: 'discount',
};

enum SearchOffersType { vector, image }
