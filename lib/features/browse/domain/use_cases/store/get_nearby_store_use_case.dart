import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/data/repos/store_repo_impl.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';

class GetNearbyStoreUseCase {
  final StoreRepoImpl _repoImpl;

  GetNearbyStoreUseCase(this._repoImpl);

  Future<Either<Failure, List<StoreEntity>>> execute({
    double radius = 10,
    required double latitude,
    required double longitude,
  }) {
    return _repoImpl.fetchStoreNearby(
      latitude: latitude,
      longitude: longitude,
      radius: radius,
    );
  }
}
