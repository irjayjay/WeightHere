import 'package:flutter/material.dart';
import 'package:weight_here/screens/auth/sign_up_screen.dart';
import 'package:weight_here/services/navigation/navigation_service.dart';
import 'package:weight_here/services/startup/auth/auth_repository.dart';

class HomeViewModel {
  final AuthRepository _authRepository;

  HomeViewModel(this._authRepository);

  void signOut() {
    _authRepository.signOut().then((success) {
      if (success) {
        NavigationService.pushReplacement(
          MaterialPageRoute(builder: (context) => const SignUpScreen()),
        );
      }
    });
  }
}
