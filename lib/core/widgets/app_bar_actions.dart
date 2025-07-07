import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_state.dart';
import 'package:gpa_calculator/feature/tabs/notes_tab/ui/widgets/note_body_container.dart';

List<Widget> buildAppBarActions({
  required BuildContext context,
  required int currentTabIndex,
  required VoidCallback onSelect,
  bool isSemesterScreen = false,
  bool isNotScenariosScreen = true,
}) {
  return [
    Padding(
      padding: EdgeInsets.only(right: isNotScenariosScreen ? 0 : 12.w),
      child: GestureDetector(
        onTap: currentTabIndex == 0 ? onSelect : null,
        child: Text(
          'SELECT',
          style: TextStyle(
            color: currentTabIndex == 0 ? Colors.white : Colors.white60,
          ),
        ),
      ),
    ),
    if (isSemesterScreen)
      BlocBuilder<SemesterScreenCubit, SemesterScreenState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => NoteBodyContainer(),
                );
              },
              child: Icon(Icons.note),
            ),
          );
        },
      ),
    if (isNotScenariosScreen)
      PopupMenuButton(
        icon: Icon(Icons.more_vert),
        itemBuilder:
            (context) => [
              PopupMenuItem(value: 1, child: Text('Settings')),
              PopupMenuItem(value: 2, child: Text('Scales')),
            ],
        onSelected: (value) async {
          if (value == 1) {
            context.pushNamed(AppRoutes.settingsScreen);
          }
          if (value == 2) {
            context.pushNamed(AppRoutes.scalesScreen);
          }
        },
      ),
  ];
}
