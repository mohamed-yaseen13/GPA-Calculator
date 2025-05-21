import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SemesterScreenBodyCourseRow extends StatelessWidget {
  Box box;
  List<CourseModel> courses;
  bool selectionMode;
  final Function(int) onToggleSelect;
  List<TextEditingController> nameControllers;
  List<String> grades;
  final void Function(String? value, int index) onChanged;
  List<TextEditingController> creditControllers;
  SemesterScreenBodyCourseRow({
    super.key,
    required this.box,
    required this.courses,
    required this.selectionMode,
    required this.onToggleSelect,
    required this.nameControllers,
    required this.grades,
    required this.onChanged,
    required this.creditControllers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          courses.asMap().entries.map((entry) {
            final index = entry.key;
            final course = entry.value;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  horizontalSpace(16),
                  selectionMode
                      ? IconButton(
                        icon: Icon(
                          course.selected == true
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          onToggleSelect(index);
                        },
                      )
                      : Text('${index + 1}', style: TextStyle(fontSize: 16.sp)),
                  horizontalSpace(16),
                  Expanded(
                    child: TextFormField(
                      controller: nameControllers[index],
                      textAlign: TextAlign.center,
                      inputFormatters: [LengthLimitingTextInputFormatter(20)],
                      decoration: InputDecoration(
                        hintText: 'Course Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.mainOrange),
                        ),
                      ),
                      onChanged: (value) {
                        courses[index].name = value;
                      },
                    ),
                  ),
                  horizontalSpace(32),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: courses[index].grade,
                      items:
                          grades.map((grade) {
                            return DropdownMenuItem<String>(
                              value: grade,
                              child: Text(grade),
                            );
                          }).toList(),
                      onChanged: (value) => onChanged(value, index),
                    ),
                  ),
                  horizontalSpace(16),
                  Expanded(
                    child: TextFormField(
                      controller: creditControllers[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d*'),
                        ),
                      ],
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.mainOrange),
                        ),
                      ),
                      onChanged: (value) {
                        double val = double.tryParse(value) ?? 0;
                        if (val > 10) {
                          val = 10;
                          creditControllers[index].text = '10';
                          creditControllers[index]
                              .selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: creditControllers[index].text.length,
                            ),
                          );
                        }
                        courses[index].credits = val;
                      },
                    ),
                  ),
                  horizontalSpace(16),
                ],
              ),
            );
          }).toList(),
    );
  }
}
