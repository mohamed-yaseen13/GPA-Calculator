import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/widgets/app_bar_actions.dart';
import 'package:gpa_calculator/core/widgets/selection_ui.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_screen_app_bar_drop_down_menu.dart';

class SemesterScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SemesterScreenAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          !context.read<SemesterScreenCubit>().state.selectionMode
              ? SemesterScreenAppBarDropDownMenu()
              : null,
      centerTitle: false,
      automaticallyImplyLeading: false,
      actions:
          !context.read<SemesterScreenCubit>().state.selectionMode
              ? buildAppBarActions(
                context: context,
                currentTabIndex: 0,
                onSelect: context.read<SemesterScreenCubit>().select,
              )
              : [],
      flexibleSpace:
          context.read<SemesterScreenCubit>().state.selectionMode
              ? buildSelectionUI(
                context: context,
                onCancelSelection:
                    context.read<SemesterScreenCubit>().cancelSelection,
                onSelectAll: context.read<SemesterScreenCubit>().selectAll,
                onDelete: () {
                  context.read<SemesterScreenCubit>().deleteSelected;
                  context.read<GpaCalculationsCubit>().calculateGpaAndCgpa();
                },
                selectedItem:
                    context.read<SemesterScreenCubit>().state.selectedItem,
                content: 'Courses',
              )
              : null,
    );
  }
}
