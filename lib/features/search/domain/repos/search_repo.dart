import 'dart:io';

import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';

import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<OfferEntity>>> searchOffesByKeyword(
    String searchKeyword,
  );
  Future<Either<Failure, List<OfferEntity>>> searchOffesByImage(
    File image,
  );
}