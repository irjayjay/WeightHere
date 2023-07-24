import 'package:weight_here/services/startup/auth/auth_repository.dart';

class AuthService {
  final AuthRepository authRepository;
  AuthService(this.authRepository);

  Future signIn({
    required String email,
    required String password,
  }) =>
      authRepository.signIn(
        email: email,
        password: password,
      );

  Future signUp({
    required String email,
    required String password,
  }) =>
      authRepository.signIn(email: email, password: password);
}
