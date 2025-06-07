import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
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
                      scale: allScales[i]['scale'],
                    ),
                  verticalSpace(32),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                    ),
                    onPressed: () async {
                      final result = await context.pushNamed(
                        AppRoutes.customScaleScreen,
                      );
                      if (result is Map<String, dynamic>) {
                        context.read<ScalesCubit>().addCustomScale(result);
                      }
                    },
                    child: Text(
                      'Add Custom Scale',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
