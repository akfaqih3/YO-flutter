import '../entities/login.dart';
import '../repositories/login_repository.dart';


class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<Login> execute(String email, String password) async {
    return _loginRepository.login(email, password);
  }
}

class RefreshTokenUseCase {
  final LoginRepository _loginRepository;

  RefreshTokenUseCase(this._loginRepository);

  Future<Login> execute(String refresh) async {
    return _loginRepository.refreshToken(refresh);
  }
}

class LogoutUseCase {
  final LoginRepository _loginRepository;

  LogoutUseCase(this._loginRepository);

  Future<void> execute() async {
    return _loginRepository.logout();
  }
}