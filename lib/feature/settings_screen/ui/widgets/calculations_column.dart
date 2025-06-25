import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_state.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_state.dart';

class CalculationsColumn extends StatelessWidget {
  const CalculationsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, left: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Calculation',
            style: TextStyle(fontSize: 16.sp, color: AppColors.mainOrange),
          ),
          verticalSpace(12),
          InkWell(
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
                          return BlocBuilder<SettingsCubit, SettingsState>(
                            builder: (context, settingsState) {
                              return Text(
                                Scales.getAllScales(
                                  scalesState.customScales,
                                )[settingsState.selectedScaleIndex]['title'],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
