import 'package:flutter/material.dart';
import 'package:weight_here/common/errors/errors.dart';
import 'package:weight_here/features/weight_tracking/repository/weight_repository.dart';
import 'package:weight_here/features/weight_tracking/widgets/modals/edit_weight_modal/edit_weight_modal.dart';
import 'package:weight_here/services/navigation/navigation_service.dart';

/// All presentation logic for AddWeightButton
class AddWeightButtonViewModel {
  final WeightRepository _weightRepository;

  AddWeightButtonViewModel(this._weightRepository);

  Future<void> showAddModal({required BuildContext context}) async {
    if (context.mounted) {
      return showDialog(
        context: context,
        builder: (context) {
          return EditWeightModal(
            onTapAccept: (weight) {
              if (weight != null) {
                _weightRepository.create(weight).leftElseRight(context);
              }
              if (context.mounted) {
                NavigationService.pop();
              }
            },
            onTapCancel: () {
              if (context.mounted) {
                NavigationService.pop();
              }
            },
          );
        },
      );
    }
  }
}
