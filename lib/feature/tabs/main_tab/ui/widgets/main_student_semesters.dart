import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';

class MainStudentSemesters extends StatefulWidget {
  final List<SemesterModel> semesters;
  bool selectionMode;
  final Function(int) onToggleSelect;

  MainStudentSemesters({
    super.key,
    required this.semesters,
    required this.selectionMode,
    required this.onToggleSelect,
  });

  @override
  State<MainStudentSemesters> createState() => _MainStudentSemestersState();
}

class _MainStudentSemestersState extends State<MainStudentSemesters> {
  List<TextEditingController> _controllers = [];

  @override
  Widget build(BuildContext context) {
    if (_controllers.length != widget.semesters.length) {
      for (var c in _controllers) {
        c.dispose();
      }
      _controllers = List.generate(
        widget.semesters.length,
        (i) => TextEditingController(text: widget.semesters[i].name),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children:
            widget.semesters.asMap().entries.map((entry) {
              final index = entry.key;
              final semester = entry.value;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Row(
                  children: [
                    widget.selectionMode
                        ? IconButton(
                          icon: Icon(
                            semester.selected == true
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            widget.onToggleSelect(index);
                          },
                        )
                        : Text(
                          '${index + 1}',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                    horizontalSpace(16),
                    Expanded(
                      child: TextFormField(
                        controller: _controllers[index],
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Term Name',
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.mainOrange),
                          ),
                        ),
                        onChanged: (value) {
                          widget.semesters[index].name = value;
                        },
                      ),
                    ),
                    horizontalSpace(38),
                    Text(
                      semester.courses.isNotEmpty ? '${semester.gpa}' : 'NEW',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color:
                            semester.courses.isNotEmpty
                                ? Colors.black
                                : Colors.grey,
                      ),
                    ),
                    horizontalSpace(38),
                    OutlinedButton(
                      onPressed: () {
                        context.pushNamed(AppRoutes.semesterScreen);
                      },
                      child: Text(
                        'OPEN',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
