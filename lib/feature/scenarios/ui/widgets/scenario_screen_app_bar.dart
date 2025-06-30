import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/interstitial_ad_manager.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/widgets/app_bar_actions.dart';
import 'package:gpa_calculator/core/widgets/selection_ui.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_state.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/main_screen.dart';

class ScenarioScreenAppBar extends StatelessWidget {
  final String scenarioName;

  const ScenarioScreenAppBar({super.key, required this.scenarioName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationAppBarCubit, ApplicationAppBarState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: !state.selectionMode ? Text(scenarioName) : null,
            actions:
                !state.selectionMode
                    ? buildAppBarActions(
                      context: context,
                      currentTabIndex: 0,
                      onSelect:
                          () => context.read<ApplicationAppBarCubit>().select(),
                    )
                    : [],
            flexibleSpace:
                state.selectionMode
                    ? buildSelectionUI(
                      context: context,
                      onCancelSelection:
                          () =>
                              context
                                  .read<ApplicationAppBarCubit>()
                                  .cancelSelection(),
                      onSelectAll:
                          () =>
                              context
                                  .read<ApplicationAppBarCubit>()
                                  .selectAll(),
                      onDelete: () {
                        context.read<ApplicationAppBarCubit>().deleteSelected();
                        context
                            .read<GpaCalculationsCubit>()
                            .calculateGpaAndCgpa();
                        InterstitialAdManager.showInterstitialAd();
                      },
                      selectedItem: state.selectedItem,
                      content: 'Semesters',
                    )
                    : null,
          ),
          body: BlocProvider.value(
            value: context.read<GpaCalculationsCubit>(),
            child: MainScreen(),
          ),
        );
      },
    );
  }
}
