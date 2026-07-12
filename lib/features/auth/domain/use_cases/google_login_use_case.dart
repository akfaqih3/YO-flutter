import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';

import '../repos/login_repo.dart';

class GoogleLoginUseCase {
  final LoginRepo _loginRepo;

  GoogleLoginUseCase(this._loginRepo);

  Future<Either<Failure, String?>> excute() async {
    return await _loginRepo.googleLogin();
  }
}
