import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/interstitial_ad_manager.dart';
import 'package:gpa_calculator/core/widgets/app_bar_actions.dart';
import 'package:gpa_calculator/core/widgets/selection_ui.dart';
import 'package:gpa_calculator/feature/scenarios/logic/cubit/scenarios_cubit.dart';
import 'package:gpa_calculator/feature/scenarios/logic/cubit/scenarios_state.dart';

class ScenariosScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ScenariosScreenAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScenariosCubit, ScenariosState>(
      builder: (context, state) {
        return AppBar(
          title: !state.selectionMode ? Text('Scenarios') : null,
          actions:
              !state.selectionMode
                  ? buildAppBarActions(
                    context: context,
                    currentTabIndex: 0,
                    onSelect: () => context.read<ScenariosCubit>().select(),
                  )
                  : [],
          flexibleSpace:
              state.selectionMode
                  ? buildSelectionUI(
                    context: context,
                    onCancelSelection:
                        context.read<ScenariosCubit>().cancelSelection,
                    onSelectAll: context.read<ScenariosCubit>().selectAll,
                    onDelete: () {
                      context.read<ScenariosCubit>().deleteSelected();
                      InterstitialAdManager.showInterstitialAd();
                    },
                    selectedItem: state.selectedScenarios,
                    content: 'Scenarios',
                  )
                  : null,
        );
      },
    );
  }
}
