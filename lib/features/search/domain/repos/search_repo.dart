import 'dart:io';

import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:yemen_offers/features/search/data/offers_response_model.dart';
import 'package:yemen_offers/features/search/domain/entities/offers_response_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, OffersResponseEntity>> searchOffesByKeyword(
    String searchKeyword,
  );
  Future<Either<Failure, OffersResponseEntity>> searchOffesByImage(File image);
}
