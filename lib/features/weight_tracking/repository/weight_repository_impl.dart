import 'package:either_dart/either.dart';
import 'package:weight_here/common/errors/errors.dart';
import 'package:weight_here/features/weight_tracking/entity/weight.dart';
import 'package:weight_here/features/weight_tracking/model/weight_model.dart';
import 'package:weight_here/features/weight_tracking/repository/weight_repository.dart';
import 'package:weight_here/services/firestore/firestore_service.dart';
import 'package:weight_here/services/startup/auth/auth_repository.dart';

/// Firestore implementation for WeightRepository.
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
  Future<Either<AppError, void>> create(double weight) {
    return _firestoreService
        .createDoc(
      rootPath,
      WeightModel(weight: weight, date: DateTime.now()).toJson(),
    )
        .then(
      (value) {
        return Right(value);
      },
      onError: (e) {
        return Left(AppError(
          error: ErrorTypes.CreateImpossible,
          message: "Could not save weight.",
        ));
      },
    );
  }

  @override
  Stream<Either<AppError, List<Weight>>> get weights {
    return _firestoreService.snapshotStream(rootPath).map(
      (snapshot) {
        final docs = snapshot;
        final List<Weight> mapped = [];
        for (final doc in docs) {
          final json = doc.data();
          json['id'] = doc.id;
          mapped.add(WeightModel.fromJson(json));
        }
        return Right<AppError, List<Weight>>(mapped);
      },
    ).handleError((e) {
      return Left(AppError(
        error: ErrorTypes.NotFound,
        message: "Could not fetch weights.",
      ));
    }).asBroadcastStream();
  }

  @override
  Future<Either<AppError, void>> edit({
    required String id,
    required Weight weight,
  }) {
    return _firestoreService
        .updateDoc(rootPath, id, WeightModel.fromWeight(weight).toJson())
        .then<Either<AppError, void>>((value) {
      return Right(value);
    }).onError((error, stackTrace) {
      return Left(AppError(
        error: ErrorTypes.UpdateImpossible,
        message: "Could not update weight.",
      ));
    });
  }

  @override
  Future<Either<AppError, void>> delete({required String id}) {
    return _firestoreService
        .deleteDoc(id, rootPath)
        .then<Either<AppError, void>>((value) {
      return Right(value);
    }).onError((error, stackTrace) {
      return Left(AppError(
        error: ErrorTypes.DeleteImpossible,
        message: "Could not delete.",
      ));
    });
  }
}
