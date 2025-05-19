import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/main_dashboard/tabs/main_tab/data/models/student_model.dart';
import 'package:gpa_calculator/feature/main_dashboard/tabs/main_tab/semester/data/models/semester_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainStudentSemesters extends StatefulWidget {
  final Box box;
  bool selectionMode;
  final Function(int) onToggleSelect;

  MainStudentSemesters({
    super.key,
    required this.box,
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
    StudentModel student = widget.box.get('default');

    List<SemesterModel> semesters = student.semesters;

    if (_controllers.length != semesters.length) {
      for (var c in _controllers) {
        c.dispose();
      }
      _controllers = List.generate(
        semesters.length,
        (i) => TextEditingController(text: semesters[i].name),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children:
            semesters.asMap().entries.map((entry) {
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
                          semesters[index].name = value;
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
                      onPressed: () {},
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
