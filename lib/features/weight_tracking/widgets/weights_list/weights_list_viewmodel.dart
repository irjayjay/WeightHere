import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:weight_here/common/errors/errors.dart';
import 'package:weight_here/common/widgets/modals/yes_no_modal.dart';
import 'package:weight_here/features/weight_tracking/entity/weight.dart';
import 'package:weight_here/features/weight_tracking/repository/weight_repository.dart';
import 'package:weight_here/features/weight_tracking/widgets/modals/edit_weight_modal/edit_weight_modal.dart';
import 'package:weight_here/services/navigation/navigation_service.dart';

/// Presentation and business logic for [WeightsList].
class WeightsListViewModel {
  final WeightRepository _repository;

  StreamSubscription? _streamSubscription;
  final _weightStreamController = StreamController<List<Weight>>();

  WeightsListViewModel(this._repository) {
    _streamSubscription = _repository.weights.listen((event) {
      event.either(
        (left) => null,
        (right) {
          _currentWeights = right;
          _weightStreamController.add(right);
        },
      );
    });
  }

  late final Stream<List<Weight>> weights =
      _weightStreamController.stream.asBroadcastStream();

  List<Weight> _currentWeights = [];

  /// For conveniently getting the Weight data while editing.
  Weight _getWeightById(String id) {
    return _currentWeights.firstWhere((weight) => weight.id == id);
  }

  /// Open the edit modal.
  Future<void> startEdit({required String id, required BuildContext context}) {
    if (context.mounted) {
      return showDialog(
          context: context,
          builder: (context) {
            return EditWeightModal(onTapAccept: (weight) {
              if (context.mounted) NavigationService.instance.pop();
              if (weight != null) {
                _saveEdit(
                  id: id,
                  weight: weight,
                ).leftElseRight(context);
              }
            }, onTapCancel: () {
              if (context.mounted) NavigationService.instance.pop();
            });
          });
    }
    return Future.value();
  }

  /// Save to datastore, close modal and update list.
  Future<Either<AppError, void>> _saveEdit({
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
                  NavigationService.instance.pop();
                }
                _delete(id: weight.id).leftElseRight(context);
              },
              titleButton2: "no",
              onPressedButton2: () {
                if (context.mounted) {
                  NavigationService.instance.pop();
                }
              },
            );
          });
    }
  }

  /// Delete and update data store.
  Future<Either<AppError, void>> _delete({required String id}) {
    return _repository.delete(id: id);
  }

  dispose() {
    _streamSubscription?.cancel();
  }
}
