import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/interstitial_ad_manager.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/widgets/app_bar_actions.dart';
import 'package:gpa_calculator/core/widgets/selection_ui.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_state.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/course_screen_app_bar_drop_down_menu.dart';

class CourseScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CourseScreenAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseScreenCubit, CourseScreenState>(
      builder: (context, state) {
        return AppBar(
          title: !state.selectionMode ? const CourseScreenAppBarDropDownMenu() : null,
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions:
              !state.selectionMode
                  ? buildAppBarActions(
                    context: context,
                    currentTabIndex: 0,
                    onSelect: context.read<CourseScreenCubit>().select,
                  )
                  : [],
          flexibleSpace:
              state.selectionMode
                  ? buildSelectionUI(
                    context: context,
                    onCancelSelection:
                        context.read<CourseScreenCubit>().cancelSelection,
                    onSelectAll: context.read<CourseScreenCubit>().selectAll,
                    onDelete: () {
                      context.read<CourseScreenCubit>().deleteSelected();
                      context
                          .read<GpaCalculationsCubit>()
                          .calculateGpaAndCgpa();
                      InterstitialAdManager.showInterstitialAd();
                    },
                    selectedItem: state.selectedSections,
                    content: 'Sections',
                  )
                  : null,
        );
      },
    );
  }
}
