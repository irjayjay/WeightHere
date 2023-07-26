import 'package:flutter/material.dart';
import 'package:weight_here/const/colors.dart';
import 'package:weight_here/features/weight_tracking/widgets/add_button/add_button.dart';
import 'package:weight_here/features/weight_tracking/widgets/weights_list/weights_list.dart';
import 'package:weight_here/screens/home/home_viewmodel.dart';
import 'package:weight_here/services/startup/auth/auth_repository_impl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _viewModel = HomeViewModel(AuthRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: ProjectColors.background,
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Home'),
        leading: PopupMenuButton(
          onSelected: (id) {
            switch (id) {
              case 1:
              default:
                _viewModel.signOut(context);
                break;
            }
          },
          itemBuilder: (context) {
            return const [
              PopupMenuItem(value: 1, child: Text("Sign out")),
            ];
          },
          child: const Icon(
            Icons.menu, // add custom icons also
          ),
        ),
      ),
      body: const Stack(
        children: [
          Positioned.fill(
            child: WeightsListWidget(),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: AddWeightButton(),
            ),
          ),
        ],
      ),

// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
