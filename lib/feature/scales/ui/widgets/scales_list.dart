import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/scales_grade_table.dart';

class ScalesList extends StatefulWidget {
  final String title;
  final List<List<String>> scales;

  const ScalesList({super.key, required this.title, required this.scales});

  @override
  State<ScalesList> createState() => _ScalesListState();
}

class _ScalesListState extends State<ScalesList> {
  bool isExpanded = false;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.h, right: 12.w, left: 12.w),
          child: Container(
            width: double.infinity,
            height: 36.h,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16.sp),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Row(
                children: [
                  horizontalSpace(12),
                  Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                      color: isExpanded ? Colors.black : Colors.white,
                    ),
                  ),
                  horizontalSpace(12),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: Icon(
                        isSelected
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: isSelected ? AppColors.mainOrange : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isExpanded) ScalesGradeTable(scales: widget.scales),
      ],
    );
  }
}
