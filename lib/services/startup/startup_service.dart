import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weight_here/services/startup/firebase/firebase_service.dart';

class StartupService {
  StartupService._();

  /// Singleton instance getter.
  static StartupService get instance => _instance ??= StartupService._();
  static StartupService? _instance;

  /// Future completes once startup has happened.
  late final Future<void> startup = _initialiseComponents();

  Future<void> _initialiseComponents() async {
    WidgetsFlutterBinding.ensureInitialized();

    for (final component in _startupComponents) {
      await component.initialize();
    }
  }

  final List<StartupComponent> _startupComponents = [FirebaseService()];
}

abstract class StartupComponent {
  Future<void> initialize();
}