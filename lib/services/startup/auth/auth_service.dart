import 'package:weight_here/services/startup/auth/auth_repository.dart';

// TODO(JJ): Do I need this?
class AuthService {
  final AuthRepository _authRepository;
  AuthService(this._authRepository);

  bool get isAuthorized => _authRepository.isAuthorized;

  Future signIn({
    required String email,
    required String password,
  }) =>
      _authRepository.signIn(
        email: email,
        password: password,
      );

  Future signUp({
    required String email,
    required String password,
  }) =>
      _authRepository.signIn(email: email, password: password);
}
