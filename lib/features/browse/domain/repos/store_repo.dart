import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:dartz/dartz.dart';
abstract class StoreRepo {
  Future<Either<Failure, StoreEntity>> getStoreDetails(String storeSlug);
} 