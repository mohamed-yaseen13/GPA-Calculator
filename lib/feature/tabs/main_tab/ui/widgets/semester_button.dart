import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';

class SemesterButton extends StatelessWidget {
  final int index;
  final SemesterModel semester;

  const SemesterButton({
    super.key,
    required this.index,
    required this.semester,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Align(
        alignment:
            semester.name.length > 10
                ? Alignment.centerRight
                : Alignment.center,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            context.pushNamed(
              AppRoutes.semesterScreen,
              arguments: {'semesterIndex': index},
            );
          },
          child: Text(
            semester.name,
            style: TextStyle(fontSize: 16.sp),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
