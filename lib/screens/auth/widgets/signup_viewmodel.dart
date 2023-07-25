class SignUpWidgetViewModel {
  final AuthCallback _submitCallback;
  final AuthCallback _submitCallback2;
  String email = '';
  String password = '';

  SignUpWidgetViewModel(this._submitCallback, this._submitCallback2);

  void submit() => _submitCallback(email, password);
  void submit2() => _submitCallback2(email, password);
}

typedef AuthCallback = Function(
  String email,
  String password,
);
