import 'package:flutter/material.dart';
import 'package:weight_here/main_viewmodel.dart';
import 'package:weight_here/services/startup/auth/auth_repository_impl.dart';
import 'package:weight_here/services/startup/startup_service.dart';

void main() async {
  // Await startup.
  await StartupService.instance.startup;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _viewModel = MainViewModel(AuthRepositoryImpl());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: _viewModel.initialHomeWidget,
    );
  }
}
