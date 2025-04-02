import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/browse/domain/entities/category_entity.dart';

abstract class BrowseRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
