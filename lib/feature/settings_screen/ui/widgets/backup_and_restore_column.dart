import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/widgets/backup_row.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/widgets/restore_row.dart';

class BackupAndRestoreColumn extends StatelessWidget {
  const BackupAndRestoreColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h, left: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Backup & Restore',
            style: TextStyle(fontSize: 16.sp, color: AppColors.mainOrange),
          ),
          verticalSpace(12),
          BackupRow(),
          Divider(color: Colors.grey, thickness: 1, height: 0),
          RestoreRow(),
        ],
      ),
    );
  }
}
