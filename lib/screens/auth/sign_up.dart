import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class signUp extends StatelessWidget {
  const signUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
              child: Card(
                  child: Column(
        children: [Text('Register')],
      )))),
    );
  }
}
