import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weight_here/features/weight_tracking/entity/weight.dart';
import 'package:weight_here/features/weight_tracking/repository/weight_repository_impl.dart';
import 'package:weight_here/features/weight_tracking/widgets/weights_list_viewmodel.dart';
import 'package:weight_here/screens/home/widgets/list_item.dart';
import 'package:weight_here/services/firestore/firestore_service.dart';
import 'package:weight_here/services/startup/auth/auth_repository_impl.dart';

class WeightsListWidget extends StatefulWidget {
  const WeightsListWidget({super.key});

  @override
  State<WeightsListWidget> createState() => _WeightsListWidgetState();
}

class _WeightsListWidgetState extends State<WeightsListWidget> {
  final _viewModel = WeightsListViewModel(WeightRepositoryImpl(
    FirestoreService(),
    AuthRepositoryImpl(),
  ));

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Weight>>.value(
      value: _viewModel.weights,
      initialData: const [],
      builder: (providerContext, child) {
        final snapshot = Provider.of<List<Weight>>(providerContext);
        if (snapshot.isNotEmpty) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: snapshot.length,
                  (context, index) {
                    //
                    return ListItemWeight(
                      title: snapshot[index].weightKg,
                      onTapDelete: () {
                        _viewModel.startDelete(
                          weight: snapshot[index],
                          context: context,
                        );
                      },
                      onTapEdit: () {
                        _viewModel.startEdit(
                          id: snapshot[index].id,
                          context: context,
                        );
                      },
                    );
                  },
                ),
              ),
              const SliverFillRemaining(child: SizedBox(height: 80)),
            ],
          );
        }
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No weight measurements recorded.'),
            Text('To record your weight, tap the add button below.'),
          ],
        );
      },
    );
  }
}
