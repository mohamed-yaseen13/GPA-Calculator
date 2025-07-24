import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/widgets/note_row.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/widgets/password_row.dart';

class PreferencesColumn extends StatelessWidget {
  const PreferencesColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h, left: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preferences',
            style: TextStyle(fontSize: 16.sp, color: AppColors.mainOrange),
          ),
          verticalSpace(12),
          const PasswordRow(),
          const Divider(color: Colors.grey, thickness: 1, height: 0),
          const NoteRow(),
        ],
      ),
    );
  }
}
