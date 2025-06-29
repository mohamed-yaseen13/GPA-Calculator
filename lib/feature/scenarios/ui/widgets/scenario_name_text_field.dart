import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/scenarios/logic/cubit/scenarios_cubit.dart';
import 'package:gpa_calculator/feature/scenarios/logic/cubit/scenarios_state.dart';

class ScenarioNameTextField extends StatelessWidget {
  final TextEditingController controller;

  const ScenarioNameTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScenariosCubit, ScenariosState>(
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          inputFormatters: [LengthLimitingTextInputFormatter(20)],
          decoration: InputDecoration(
            labelText: 'Scenario Name',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainOrange),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter Scenario name';
            }
            for (var scenario in state.scenarios) {
              if (scenario.name == value) {
                return 'Scenario already exists';
              }
            }
            return null;
          },
        );
      },
    );
  }
}
