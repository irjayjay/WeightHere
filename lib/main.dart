import 'package:flutter/material.dart';
import 'package:weight_here/const/colors.dart';
import 'package:weight_here/main_viewmodel.dart';
import 'package:weight_here/services/navigation/navigation_service.dart';
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
      navigatorKey: NavigationService.instance.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: ProjectColors.text,
              displayColor: ProjectColors.text,
            ),
      ),
      home: _viewModel.initialHomeWidget,
    );
  }
}
