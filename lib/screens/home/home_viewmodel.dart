import 'package:flutter/material.dart';
import 'package:weight_here/screens/auth/sign_up_screen.dart';
import 'package:weight_here/services/startup/auth/auth_repository.dart';

class HomeViewModel {
  final AuthRepository _authRepository;

  HomeViewModel(this._authRepository);

  void signOut(BuildContext context) {
    _authRepository.signOut().then((success) {
      if (success && context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()),
        );
      }
    });
  }
}
