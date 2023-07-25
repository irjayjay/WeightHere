import 'package:flutter/material.dart';
import 'package:weight_here/screens/auth/sign_up_screen.dart';
import 'package:weight_here/screens/home/home_screen.dart';
import 'package:weight_here/services/startup/auth/auth_repository_impl.dart';

class MainViewModel {
  final AuthRepositoryImpl _authRepository;

  MainViewModel(this._authRepository);

  Widget get initialHomeWidget {
    // TODO(JJ): fix:
    if (_authRepository.isAuthorized) {
      return const HomeScreen();
    }
    return const SignUpScreen();
  }
}
