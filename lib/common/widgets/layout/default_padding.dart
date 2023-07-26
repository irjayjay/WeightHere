import 'package:flutter/widgets.dart';

/// Convenience widget to quickly add padding to the UI.
class DefaultPadding extends StatelessWidget {
  final Widget child;

  const DefaultPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: child,
    );
  }
}
