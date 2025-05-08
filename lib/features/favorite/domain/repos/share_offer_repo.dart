import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';

abstract class ShareOfferRepo {
  Future<Either<Failure, void>> shareOfferUser(String offerSlug);
}