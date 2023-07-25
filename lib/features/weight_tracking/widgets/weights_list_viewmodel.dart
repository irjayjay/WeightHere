import 'package:flutter/material.dart';
import 'package:weight_here/common/widgets/modals/yes_no_modal.dart';
import 'package:weight_here/features/weight_tracking/entity/weight.dart';
import 'package:weight_here/features/weight_tracking/repository/weight_repository.dart';
import 'package:weight_here/features/weight_tracking/widgets/modals/edit_weight_modal/edit_weight_modal.dart';

class WeightsListViewModel {
  final WeightRepository _repository;
  WeightsListViewModel(this._repository) {
    weights.listen((event) {
      _currentWeights = event;
    });
  }

  late final Stream<List<Weight>> weights = _repository.weights;
  List<Weight> _currentWeights = [];

  /// Open the edit modal.
  Future<void> startEdit({required String id, required BuildContext context}) {
    if (context.mounted) {
      return showDialog(
          context: context,
          builder: (context) {
            return EditWeightModal(onTapAccept: (weight) {
              if (context.mounted) Navigator.pop(context);
              if (weight != null) {
                _saveEdit(id: id, weight: weight);
              }
            }, onTapCancel: () {
              if (context.mounted) Navigator.pop(context);
            });
          });
    }
    return Future.value();
  }

  Weight _getWeightById(String id) {
    return _currentWeights.firstWhere((weight) => weight.id == id);
  }

  /// Save to datastore, close modal and update list.
  Future<void> _saveEdit({
    required String id,
    required double weight,
  }) {
    final foundWeight = _getWeightById(id);
    final newWeight = Weight(
      id: foundWeight.id,
      date: foundWeight.date,
      weight: weight,
    );
    return _repository.edit(id: id, weight: newWeight);
  }

  /// Open delete modal.
  Future<void> startDelete({
    required Weight weight,
    required BuildContext context,
  }) async {
    if (context.mounted) {
      await showDialog(
          context: context,
          builder: (context) {
            return YesNoModal(
              title: "Delete?",
              titleButton1: "yes",
              onPressedButton1: () async {
                if (context.mounted) {
                  Navigator.pop(context);
                }
                _delete(id: weight.id);
              },
              titleButton2: "no",
              onPressedButton2: () {
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            );
          });
    }
  }

  /// Delete and update data store.
  Future<void> _delete({required String id}) {
    return _repository.delete(id: id);
  }
}
