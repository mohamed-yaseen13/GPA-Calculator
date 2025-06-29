import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/scenarios/data/models/scenario_model.dart';
import 'package:gpa_calculator/feature/scenarios/logic/cubit/scenarios_cubit.dart';

class ScenariosSelection extends StatelessWidget {
  final int index;
  final ScenarioModel scenario;

  const ScenariosSelection({
    super.key,
    required this.scenario,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final selectionMode = context.read<ScenariosCubit>().state.selectionMode;
    return selectionMode
        ? SizedBox(
          height: 24.h,
          width: 16.w,
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Icon(
              scenario.selected == true
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: Colors.black,
            ),
            onPressed: () {
              context.read<ScenariosCubit>().toggleSelect(index);
            },
          ),
        )
        : Text('${index + 1}', style: TextStyle(fontSize: 16.sp));
  }
}
