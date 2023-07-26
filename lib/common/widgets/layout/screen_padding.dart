import 'package:flutter/widgets.dart';

/// Convenience widget to quickly add padding to screens.
class ScreenPadding extends StatelessWidget {
  final Widget child;

  const ScreenPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: child,
    );
  }
}
