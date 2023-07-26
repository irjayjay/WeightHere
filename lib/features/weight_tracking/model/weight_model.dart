import 'package:weight_here/features/weight_tracking/entity/weight.dart';

/// Serves to deserialize raw data in repositories.
class WeightModel extends Weight {
  WeightModel({
    String id = '',
    required DateTime date,
    required double weight,
  }) : super(
          id: id,
          date: date,
          weight: weight,
        );

  static const idField = 'id';
  static const weightField = 'weight';
  static const datetimeField = 'datetime';

  factory WeightModel.fromWeight(Weight weight) {
    return WeightModel(
      date: weight.date,
      weight: weight.weight,
      id: weight.id,
    );
  }

  factory WeightModel.fromJson(Map<String, dynamic> json) {
    return WeightModel(
      id: json[idField] as String,
      weight: json[weightField],
      date: DateTime.parse(json[datetimeField]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id.isNotEmpty) idField: id,
      weightField: weight,
      datetimeField: date.toIso8601String(),
    };
  }
}
