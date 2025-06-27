import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/grade_drop_down.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_state.dart';

class FailedOnCourseLogicRow extends StatefulWidget {
  const FailedOnCourseLogicRow({super.key});

  @override
  State<FailedOnCourseLogicRow> createState() => _FailedOnCourseLogicRowState();
}

class _FailedOnCourseLogicRowState extends State<FailedOnCourseLogicRow> {
  String _selectedGrade = '--';

  @override
  void initState() {
    super.initState();
    _loadSelectedGrade();
  }

  void _loadSelectedGrade() async {
    _selectedGrade = await PrefsHelper.getLimitation() ?? '--';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 18.h),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Row(
            children: [
              SvgPicture.asset('assets/images/password_lock.svg'),
              horizontalSpace(24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "If you failed at course \nwhat's the max grade you can get",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color:
                          state.isThereLimitationsAfterFallOnCourse
                              ? Colors.black
                              : Colors.grey,
                    ),
                  ),
                  verticalSpace(12),
                  SizedBox(
                    width: 150.w,
                    height: 50.h,
                    child: IgnorePointer(
                      ignoring: !state.isThereLimitationsAfterFallOnCourse,
                      child: GradeDropDown(
                        selectedGrade: _selectedGrade,
                        onChanged: (value) async {
                          setState(() {
                            _selectedGrade = value!;
                          });
                          await PrefsHelper.setLimitationsAfterFallOnCourse(
                            _selectedGrade,
                          );
                          context.read<GpaCalculationsCubit>().loadSettings();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Switch(
                value: state.isThereLimitationsAfterFallOnCourse,
                onChanged: (value) async {
                  context
                      .read<SettingsCubit>()
                      .enableOrDisableLimitationsAfterFallOnCourse(value);
                  context
                      .read<CourseScreenCubit>()
                      .enableOrDisableLimitationsAfterFallOnCourse(value);
                  context
                      .read<GpaCalculationsCubit>()
                      .enableOrDisableLimitationsAfterFallOnCourse(value);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
