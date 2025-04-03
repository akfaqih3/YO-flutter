import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/data/models/category_model.dart';
import 'package:yemen_offers/features/browse/data/sources/browse_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';
import 'package:yemen_offers/features/browse/domain/repos/browse_repo.dart';

class BrowseRepoImpl implements BrowseRepo {
  final BrowseRemoteDataSource _remoteDataSource;

  BrowseRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final List<CategoryModel> categories =
          await _remoteDataSource.getCategories();
      return Right(categoryEntityFromModel(categories));
    } catch (e) {
      return Left(Exceptions.handleCatch(e));
    }
  }
}