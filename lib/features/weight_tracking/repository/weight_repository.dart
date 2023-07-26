import 'package:either_dart/either.dart';
import 'package:weight_here/common/errors/errors.dart';
import 'package:weight_here/features/weight_tracking/entity/weight.dart';

/// Contract that any weight data source should implement.
abstract class WeightRepository {
  Stream<Either<AppError, List<Weight>>> get weights;

  Future<Either<AppError, void>> create(double weight);

  Future<Either<AppError, void>> delete({required String id});

  Future<Either<AppError, void>> edit(
      {required String id, required Weight weight});
}
