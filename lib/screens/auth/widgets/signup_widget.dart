import 'package:flutter/material.dart';

class SignUpWidget extends StatelessWidget {
  final String title;
  final String buttonText;
  final Function submitCallback;
  SignUpWidget({
    required this.title,
    required this.buttonText,
    required this.submitCallback,
    super.key,
  }) {
    _viewModel = _ViewModel(submitCallback);
  }

  late final _ViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Form(
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'email'),
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
            decoration: const InputDecoration(labelText: 'Password'),
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
          ElevatedButton(
            onPressed: _viewModel.submit,
            child: Text(buttonText),
          ),
        ],
      ),
    ));
  }
}

class _ViewModel {
  final Function _submitCallback;
  String email = '';
  String password = '';
  _ViewModel(this._submitCallback);

  void submit() {}
}
