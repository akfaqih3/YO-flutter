import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/onboarding/data/repos/onboarding_repo_impl.dart';

class SetFalseFirstOpenAppUseCase {
  final OnboardingRepoImpl onboardingRepoImpl;
  SetFalseFirstOpenAppUseCase(this.onboardingRepoImpl);

   Future<Either<Failure, void>> execute() async {
    return await onboardingRepoImpl.setFalseFirstOpenApp();
  }
}
