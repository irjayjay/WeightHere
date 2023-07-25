import 'package:flutter/material.dart';
import 'package:weight_here/common/widgets/buttons/circular_button.dart';
import 'package:weight_here/features/weight_tracking/repository/weight_repository_impl.dart';
import 'package:weight_here/features/weight_tracking/widgets/add_button/add_button_viewmodel.dart';
import 'package:weight_here/services/firestore/firestore_service.dart';
import 'package:weight_here/services/startup/auth/auth_repository_impl.dart';

class AddWeightButton extends StatefulWidget {
  const AddWeightButton({super.key});

  @override
  State<AddWeightButton> createState() => _AddWeightButtonState();
}

class _AddWeightButtonState extends State<AddWeightButton> {
  final _viewModel = AddWeightButtonViewModel(
    WeightRepositoryImpl(
      FirestoreService(),
      AuthRepositoryImpl(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CircularButtonWidget(
      onPressed: () {
        _viewModel.showAddModal(context: context);
      },
      size: const Size(60, 60),
      child: const Icon(Icons.add, size: 50),
    );
  }
}
