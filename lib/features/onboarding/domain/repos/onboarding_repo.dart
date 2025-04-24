


import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';

abstract class OnboardingRepo {
  Future<Either<Failure, void>> setFalseFirstOpenApp();
}