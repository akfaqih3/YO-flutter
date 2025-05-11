import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/data/models/store_model.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:yemen_offers/features/browse/domain/repos/store_repo.dart';
import 'package:yemen_offers/features/browse/data/sources/store_remote_data_source.dart';

class StoreRepoImpl implements StoreRepo {
  final StoreRemoteDataSource _remoteDataSource;
  StoreRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, StoreEntity>> getStoreDetails(String storeSlug) {
    // TODO: implement getStoreDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<StoreEntity>>> fetchStoreNearby({
    required double latitude,
    required double longitude,
    required double radius,
  }) async {
    try {
      final List<StoreModel> stores = await _remoteDataSource.fetchStoreNearby(
        latitude: latitude,
        longitude: longitude,
        radius: radius,
      );
      return Right(storeEntityFromModel(stores));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }
}
