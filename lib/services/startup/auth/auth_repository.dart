// TODO(JJ): Implement the use of [Either].
abstract class AuthRepository {
  bool get isAuthorized;

  String? get userId;

  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> register({
    required String email,
    required String password,
  });

  Future<bool> signOut();
}
