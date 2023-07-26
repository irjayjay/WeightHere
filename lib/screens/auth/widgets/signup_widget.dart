import 'package:flutter/material.dart';
import 'package:weight_here/screens/auth/widgets/signup_viewmodel.dart';

class SignUpWidget extends StatefulWidget {
  final String title;
  final String buttonText;
  final String buttonText2;
  final AuthCallback submitCallback;
  final AuthCallback submitCallback2;

  const SignUpWidget({
    required this.title,
    required this.buttonText,
    required this.buttonText2,
    required this.submitCallback,
    required this.submitCallback2,
    super.key,
  });

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late final SignUpWidgetViewModel _viewModel;

  @override
  void didChangeDependencies() {
    _viewModel =
        SignUpWidgetViewModel(widget.submitCallback, widget.submitCallback2);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(labelText: 'email'),
          autofocus: true,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
          onChanged: (value) {
            _viewModel.email = value;
          },
        ),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(labelText: 'password'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
          onChanged: (value) {
            _viewModel.password = value;
          },
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _viewModel.submit,
              child: Text(widget.buttonText),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: _viewModel.submit2,
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(2),
                backgroundColor: MaterialStateProperty.all(Colors.cyan),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text(widget.buttonText2),
            ),
          ],
        ),
      ],
    );
  }
}
