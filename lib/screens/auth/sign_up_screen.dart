import 'package:flutter/material.dart';
import 'package:weight_here/common/widgets/layout/default_padding.dart';
import 'package:weight_here/common/widgets/layout/screen_padding.dart';
import 'package:weight_here/const/colors.dart';
import 'package:weight_here/screens/auth/sign_up_viewmodel.dart';
import 'package:weight_here/screens/auth/widgets/signup_widget.dart';
import 'package:weight_here/services/startup/auth/auth_repository_impl.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final _viewModel = SignUpViewModel(AuthRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.background,
      body: ScreenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: DefaultPadding(
                child: SignUpWidget(
                  title: "Sign in",
                  buttonText: "Sign up",
                  submitCallback: (email, password) {
                    _viewModel.signUp(
                      email: email,
                      password: password,
                    );
                  },
                  buttonText2: "Sign in",
                  submitCallback2: (email, password) {
                    _viewModel.signIn(
                      email: email,
                      password: password,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
