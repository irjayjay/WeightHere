import 'package:flutter/material.dart';
import 'package:weight_here/common/widgets/layout/default_padding.dart';

/// Generic modal that can be customised to fit most yes/no prompts.
class YesNoModal extends StatelessWidget {
  final String title;
  final String titleButton1;
  final Function onPressedButton1;
  final String titleButton2;
  final Function onPressedButton2;

  const YesNoModal({
    required this.title,
    required this.titleButton1,
    required this.onPressedButton1,
    required this.titleButton2,
    required this.onPressedButton2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultPadding(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            children: [
              Card(
                  child: DefaultPadding(
                      child: Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => onPressedButton1(),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(2),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.cyan),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        child: Text(titleButton1),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () => onPressedButton2(),
                        child: Text(titleButton2),
                      ),
                    ],
                  )
                ],
              ))),
            ],
          ),
        ],
      ),
    );
  }
}
