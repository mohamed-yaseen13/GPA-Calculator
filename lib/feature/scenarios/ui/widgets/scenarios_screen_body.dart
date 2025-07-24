import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/scenarios_table.dart';

class ScenariosScreenBody extends StatelessWidget {
  const ScenariosScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [verticalSpace(4), const Expanded(child: ScenariosTable())],
      ),
    );
  }
}
