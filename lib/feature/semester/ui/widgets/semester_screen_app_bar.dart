import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/core/widgets/app_bar_actions.dart';
import 'package:gpa_calculator/core/widgets/selection_ui.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_screen_app_bar_drop_down_menu.dart';

class SemesterScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  bool selectionMode;
  String? selectedTerm;
  int selectedIndex;
  int selectedItem;
  List<SemesterModel> semesters;
  List<CourseModel> courses;
  double? dropdownWidth;
  VoidCallback onSelect;
  VoidCallback onCancelSelection;
  VoidCallback onSelectAll;
  VoidCallback ensureDalete;
  ValueChanged<String?> onChanged;

  SemesterScreenAppBar({
    super.key,
    required this.selectionMode,
    required this.selectedTerm,
    required this.semesters,
    required this.selectedIndex,
    required this.courses,
    required this.dropdownWidth,
    required this.onSelect,
    required this.onCancelSelection,
    required this.onSelectAll,
    required this.ensureDalete,
    required this.onChanged,
    required this.selectedItem,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainOrange,
      title:
          !selectionMode
              ? SemesterScreenAppBarDropDownMenu(
                selectedTerm: selectedTerm,
                semesters: semesters,
                onChanged: onChanged,
                dropdownWidth: dropdownWidth,
              )
              : null,
      centerTitle: false,
      automaticallyImplyLeading: false,
      actions: !selectionMode ? buildAppBarActions(context, 0, onSelect) : [],
      flexibleSpace:
          selectionMode
              ? buildSelectionUI(
                context,
                onCancelSelection,
                onSelectAll,
                ensureDalete,
                selectedItem,
              )
              : null,
    );
  }
}
