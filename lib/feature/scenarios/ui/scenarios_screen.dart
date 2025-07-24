import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/widgets/app_drawer.dart';
import 'package:gpa_calculator/feature/scenarios/logic/cubit/scenarios_cubit.dart';
import 'package:gpa_calculator/feature/scenarios/logic/cubit/scenarios_state.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/scenarios_screen_app_bar.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/scenarios_screen_body.dart';

class ScenariosScreen extends StatelessWidget {
  const ScenariosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScenariosCubit, ScenariosState>(
      listenWhen:
          (previous, current) =>
              previous.scenarios.length != current.scenarios.length,
      listener: (context, state) {},
      child: BlocBuilder<ScenariosCubit, ScenariosState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const ScenariosScreenAppBar(),
            drawer:
                !state.selectionMode
                    ? const AppDrawer(selectedRoute: DrawerRoute.scenarios)
                    : null,
            body: const ScenariosScreenBody(),
          );
        },
      ),
    );
  }
}
