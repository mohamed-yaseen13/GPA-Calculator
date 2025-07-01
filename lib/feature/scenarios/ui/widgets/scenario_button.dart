import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/scenarios/data/models/scenario_model.dart';

class ScenarioButton extends StatelessWidget {
  final ScenarioModel scenario;
  final int index;

  const ScenarioButton({
    super.key,
    required this.index,
    required this.scenario,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.black),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp),
          ),
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {
          AppConstants.selectedScenario = scenario;
          AppConstants.selectedScenarioIndex = index;
          resetScenarioCubits();
          context.pushNamed(AppRoutes.scenarioMainScreen);
        },
        child: Text(
          scenario.name,
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}
