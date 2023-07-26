import 'package:flutter/material.dart';
import 'package:weight_here/screens/home/home_screen.dart';
import 'package:weight_here/services/navigation/navigation_service.dart';
import 'package:weight_here/services/startup/auth/auth_repository.dart';

class SignUpViewModel {
  final AuthRepository authRepository;
  SignUpViewModel(this.authRepository);

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    await authRepository.register(email: email, password: password);
    if (authRepository.isAuthorized) {
      NavigationService.instance.pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await authRepository.signIn(email: email, password: password);
    if (authRepository.isAuthorized) {
      NavigationService.instance.pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }
}
