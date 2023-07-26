import 'package:weight_here/features/weight_tracking/model/weight_model.dart';

/// Weight class for presentation logic.
class Weight {
  final String id;
  final DateTime date;
  final double weight;

  Weight({
    required this.id,
    required this.date,
    required this.weight,
  });

  String get weightKg => "${weight}kg";

  String get weightLb => "${weight * 2.20462}lb";

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      id: json[WeightModel.idField] as String,
      weight: double.parse(json[WeightModel.weightField]),
      date: DateTime.parse(json[WeightModel.datetimeField]),
    );
  }
}
