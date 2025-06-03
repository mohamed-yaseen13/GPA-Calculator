import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/ui/widgets/calculator_buttons_container.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/ui/widgets/calculator_display_container.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(6.sp),
        child: Column(
          children: [
            CalculatorDisplayContainer(),
            verticalSpace(6),
            CalculatorButtonsContainer(),
          ],
        ),
      ),
    );
  }
}
