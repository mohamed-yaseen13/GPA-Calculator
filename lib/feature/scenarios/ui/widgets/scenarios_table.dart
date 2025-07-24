import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/scenarios/logic/cubit/scenarios_cubit.dart';
import 'package:gpa_calculator/feature/scenarios/logic/cubit/scenarios_state.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/add_scenario_button.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/scenarios_row_data.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/scenarios_row_header.dart';

class ScenariosTable extends StatelessWidget {
  const ScenariosTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: BlocBuilder<ScenariosCubit, ScenariosState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ScenariosRowHeader(),
                      verticalSpace(8),
                      ...state.scenarios.asMap().entries.map((entry) {
                        final index = entry.key;
                        final scenario = entry.value;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: ScenariosRowData(
                            index: index,
                            scenario: scenario,
                          ),
                        );
                      }),
                      verticalSpace(76),
                    ],
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [AddScenarioButton()],
              ),
              verticalSpace(24),
            ],
          );
        },
      ),
    );
  }
}
