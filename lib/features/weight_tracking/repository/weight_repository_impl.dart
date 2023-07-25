import 'package:weight_here/features/weight_tracking/entity/weight.dart';
import 'package:weight_here/features/weight_tracking/model/weight_model.dart';
import 'package:weight_here/features/weight_tracking/repository/weight_repository.dart';
import 'package:weight_here/services/firestore/firestore_service.dart';
import 'package:weight_here/services/startup/auth/auth_repository.dart';

class WeightRepositoryImpl extends WeightRepository {
  final FirestoreService _firestoreService;
  final AuthRepository _authRepository;

  WeightRepositoryImpl(
    this._firestoreService,
    this._authRepository,
  );

  String get rootPath {
    final path = 'users/${_authRepository.userId}/weights';
    return path;
  }

  @override
  Future<void> create(double weight) {
    return _firestoreService.createDoc(
      rootPath,
      WeightModel(weight: weight, date: DateTime.now()).toJson(),
    );
  }

  @override
  Stream<List<Weight>> get weights {
    return _firestoreService.snapshotStream(rootPath).map(
      (snapshot) {
        final docs = snapshot;
        final List<Weight> mapped = [];
        for (final doc in docs) {
          final json = doc.data();
          json['id'] = doc.id;
          mapped.add(WeightModel.fromJson(json));
        }
        return mapped;
      },
    ).asBroadcastStream();
  }

  @override
  Future<void> edit({required String id, required Weight weight}) {
    return _firestoreService.updateDoc(
        rootPath, id, WeightModel.fromWeight(weight).toJson());
  }

  @override
  Future<void> delete({required String id}) {
    return _firestoreService.deleteDoc(id, rootPath);
  }
}
