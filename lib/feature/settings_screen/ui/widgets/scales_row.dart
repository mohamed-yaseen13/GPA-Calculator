import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_state.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_state.dart';

class ScalesRow extends StatelessWidget {
  const ScalesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await context.pushNamed(AppRoutes.scalesScreen);
        context.read<SettingsCubit>().getSelectedScaleIndex();
      },
      child: Padding(
        padding: EdgeInsets.only(top: 8.h, bottom: 18.h),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/calculator.svg'),
            horizontalSpace(24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GPA Calculation Scale',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                BlocBuilder<ScalesCubit, ScalesState>(
                  builder: (context, scalesState) {
                    final allScales = Scales.getAllScales(
                      scalesState.customScales,
                    );

                    return BlocBuilder<SettingsCubit, SettingsState>(
                      builder: (context, settingsState) {
                        final index = settingsState.selectedScaleIndex;

                        if (index < 0 || index >= allScales.length) {
                          return const Text('Loading or Invalid Scale');
                        }

                        return Text(allScales[index]['title']);
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
