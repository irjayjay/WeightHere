import 'package:firebase_auth/firebase_auth.dart';
import 'package:weight_here/services/startup/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  bool get isAuthorized => FirebaseAuth.instance.currentUser != null;

  @override
  String? get userId => FirebaseAuth.instance.currentUser?.uid;

  @override
  Future<void> register({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // TODO(JJ): Handle error states.
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // TODO(JJ): Handle error states.
  }

  @override
  Future<bool> signOut() {
    return FirebaseAuth.instance.signOut().then(
      (value) {
        return !isAuthorized;
      },
    );
  }
}
