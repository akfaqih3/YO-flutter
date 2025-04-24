import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/onboarding/data/sources/onboarding_local_data_source.dart';
import 'package:yemen_offers/features/onboarding/domain/repos/onboarding_repo.dart';

class OnboardingRepoImpl extends OnboardingRepo {
  final OnboardingLocalDataSource onboardingLocalDataSource;
  OnboardingRepoImpl(this.onboardingLocalDataSource);
  @override
  Future<Either<Failure, void>> setFalseFirstOpenApp() async {
    try {
      await onboardingLocalDataSource.setFalseFirstOpenApp();
      return right(null);
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }
}
