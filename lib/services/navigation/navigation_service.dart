import 'package:flutter/material.dart';

class NavigationService {
  static NavigationService? _instance;
  static NavigationService get instance {
    return _instance ??= NavigationService();
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void pop() => navigatorKey.currentState?.pop();

  Future<T?>? pushReplacement<T extends Object?, TO extends Object?>(
    Route<T> route, {
    TO? result,
  }) {
    return navigatorKey.currentState?.pushReplacement(route, result: result);
  }
}
