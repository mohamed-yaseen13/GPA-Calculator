import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/interstitial_ad_manager.dart';
import 'package:gpa_calculator/feature/scenarios/data/models/scenario_model.dart';
import 'package:gpa_calculator/feature/scenarios/logic/cubit/scenarios_cubit.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/add_scenario_bottom_shett.dart';

class EditScenarioIcon extends StatelessWidget {
  final int index;
  final ScenarioModel scenario;

  const EditScenarioIcon({
    super.key,
    required this.index,
    required this.scenario,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) => [const PopupMenuItem(value: 1, child: Text('Edit'))],
      menuPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      onSelected: (value) async {
        final scenariosCubit = context.read<ScenariosCubit>();
        final result = await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder:
              (bottomSheetContext) => BlocProvider.value(
                value: scenariosCubit,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                  ),
                  child: AddScenarioBottomShett(
                    text: 'Edit',
                    initialName: scenario.name,
                  ),
                ),
              ),
        );
        if (result != null) {
          context.read<ScenariosCubit>().addScenario(
            name: result['name'],
            index: index,
          );
          InterstitialAdManager.showInterstitialAd();
        }
      },
    );
  }
}
