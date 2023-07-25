import 'package:weight_here/features/weight_tracking/entity/weight.dart';

/// Contract that any weight data source should implement.
// TODO(JJ): Implement the use of [Either].
abstract class WeightRepository {
  Stream<List<Weight>> get weights;

  Future<void> create(double weight);

  Future<void> delete({required String id});

  Future<void> edit({required String id, required Weight weight});
}
