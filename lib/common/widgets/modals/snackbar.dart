import 'package:flutter/material.dart';

/// Callable class to more easily display a snackbar.
class SimpleTextSnackbar {
  call(BuildContext context, String text) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text)),
      );
    }
  }
}
