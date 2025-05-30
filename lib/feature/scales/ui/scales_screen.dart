import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_state.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/scale_container.dart';

class ScalesScreen extends StatelessWidget {
  const ScalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scales')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocBuilder<ScalesCubit, ScalesState>(
            builder: (context, state) {
              final allScales = Scales.getAllScales(state.customScales);
              return Column(
                children: [
                  for (int i = 0; i < allScales.length; i++)
                    ScaleContainer(
                      index: i,
                      title: allScales[i]['title'],
                      scales: allScales[i]['scale'],
                    ),
                  verticalSpace(32),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final result = await Navigator.pushNamed(
                        context,
                        AppRoutes.customScaleScreen,
                      );
                      if (result is Map<String, dynamic>) {
                        context.read<ScalesCubit>().addCustomScale(result);
                      }
                    },
                    label: Text('Add Custom Scale'),
                  ),
                  verticalSpace(12),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
