import 'package:firebase_core/firebase_core.dart';
import 'package:weight_here/services/startup/startup_service.dart';

class FirebaseService implements StartupComponent {
  @override
  Future<void> initialize() {
    return Firebase.initializeApp();
  }
}