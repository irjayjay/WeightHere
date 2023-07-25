import 'package:flutter/material.dart';
import 'package:weight_here/const/colors.dart';

class CircularButtonWidget extends StatelessWidget {
  const CircularButtonWidget({
    this.onPressed,
    this.child,
    this.color = ProjectColors.buttonPrimary,
    this.textColor = ProjectColors.onButtonPrimary,
    this.size = const Size(50, 50),
    super.key,
  });

  final void Function()? onPressed;
  final Widget? child;
  final Color color;
  final Color textColor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2),
        backgroundColor: MaterialStateProperty.all(color),
        foregroundColor: MaterialStateProperty.all(textColor),
        shape: MaterialStateProperty.all(
          CircleBorder(side: BorderSide(color: color)),
        ),
        minimumSize: MaterialStateProperty.all(size),
      ),
      child: child,
    );
  }
}
