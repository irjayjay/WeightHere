abstract class AuthRepository {
  bool get isAuthorized;
  
  Future<void> signIn({
    required String email, 
    required String password,
  });

  Future<void> register({
    required String email, 
    required String password,
  });
}