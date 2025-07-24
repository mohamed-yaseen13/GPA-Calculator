import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/interstitial_ad_manager.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/widgets/app_bar_actions.dart';
import 'package:gpa_calculator/core/widgets/selection_ui.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_state.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_screen_app_bar_drop_down_menu.dart';

class SemesterScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SemesterScreenAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SemesterScreenCubit, SemesterScreenState>(
      builder: (context, state) {
        return AppBar(
          title:
              !state.selectionMode ? const SemesterScreenAppBarDropDownMenu() : null,
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions:
              !state.selectionMode
                  ? buildAppBarActions(
                    context: context,
                    currentTabIndex: 0,
                    onSelect: context.read<SemesterScreenCubit>().select,
                    isSemesterScreen: true,
                  )
                  : [],
          flexibleSpace:
              state.selectionMode
                  ? buildSelectionUI(
                    context: context,
                    onCancelSelection:
                        context.read<SemesterScreenCubit>().cancelSelection,
                    onSelectAll: context.read<SemesterScreenCubit>().selectAll,
                    onDelete: () {
                      context.read<SemesterScreenCubit>().deleteSelected();
                      context
                          .read<GpaCalculationsCubit>()
                          .calculateGpaAndCgpa();
                      InterstitialAdManager.showInterstitialAd();
                    },
                    selectedItem: state.selectedItem,
                    content: 'Courses',
                  )
                  : null,
        );
      },
    );
  }
}
