import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';

class RestoreRow extends StatelessWidget {
  const RestoreRow({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await context.read<SettingsCubit>().restoreStudentData(context);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 18.h, bottom: 18.h),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/restore.svg',
              width: 48,
              height: 48,
            ),
            horizontalSpace(24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Restore',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text('Restore all data'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
