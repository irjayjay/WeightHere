import 'package:flutter/material.dart';
import 'package:weight_here/common/widgets/layout/default_padding.dart';
import 'package:weight_here/features/weight_tracking/widgets/modals/edit_weight_modal/edit_weight_viewmodel.dart';

/// One modal used for creating and editing weights.
/// [onTapAccept] and [onTapCancel] enable the parent widget to supply logic.
class EditWeightModal extends StatefulWidget {
  const EditWeightModal({
    required this.onTapAccept,
    required this.onTapCancel,
    super.key,
  });

  final Function(double? weight) onTapAccept;
  final Function onTapCancel;

  @override
  State<EditWeightModal> createState() => _EditWeightModalState();
}

class _EditWeightModalState extends State<EditWeightModal> {
  late final EditWeightViewModel _viewModel;

  @override
  void didChangeDependencies() {
    _viewModel = EditWeightViewModel(widget.onTapAccept, widget.onTapCancel);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultPadding(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
              child: DefaultPadding(
                  child: Column(
            children: [
              Text(
                "edit",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 32),
              TextFormField(
                decoration: const InputDecoration(labelText: 'weight'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                autofocus: true,
                onFieldSubmitted: (value) => _viewModel.accept(),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter weight in kg';
                  }
                  return null;
                },
                onChanged: (value) {
                  _viewModel.setWeight(value);
                },
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => widget.onTapCancel,
                    child: const Text("cancel"),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _viewModel.accept,
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(2),
                      backgroundColor: MaterialStateProperty.all(Colors.cyan),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text("accept"),
                  ),
                ],
              )
            ],
          ))),
        ],
      ),
    );
  }
}
