import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/add_semester_bottom_sheet.dart';

class EditSemesterIcon extends StatelessWidget {
  final int index;
  final SemesterModel semester;

  const EditSemesterIcon({
    super.key,
    required this.index,
    required this.semester,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (context) => [PopupMenuItem(value: 1, child: Text('Edit'))],
      menuPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      onSelected: (value) async {
        final result = await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder:
              (bottomSheetContext) => BlocProvider.value(
                value: context.read<ApplicationAppBarCubit>(),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                  ),
                  child: AddSemesterBottomSheet(
                    text: 'Edit',
                    initialName: semester.name,
                  ),
                ),
              ),
        );
        if (result != null) {
          context.read<ApplicationAppBarCubit>().addSemester(
            name: result['name'],
            index: index,
          );
          context.read<GpaCalculationsCubit>().calculateGpaAndCgpa();
        }
      },
    );
  }
}
