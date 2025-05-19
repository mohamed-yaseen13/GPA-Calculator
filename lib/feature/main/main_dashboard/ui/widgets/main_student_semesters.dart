import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';

class MainStudentSemesters extends StatefulWidget {
  final List<Map<String, dynamic>> semesters;
  final bool selectionMode;
  final Function(int) onToggleSelect;
  final VoidCallback onAddSemester;

  const MainStudentSemesters({
    super.key,
    required this.semesters,
    required this.onAddSemester,
    required this.onToggleSelect,
    required this.selectionMode,
  });

  @override
  State<MainStudentSemesters> createState() => _MainStudentSemestersState();
}

class _MainStudentSemestersState extends State<MainStudentSemesters> {
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.semesters.length,
      (i) => TextEditingController(text: widget.semesters[i]['term']),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_controllers.length != widget.semesters.length) {
      for (var c in _controllers) {
        c.dispose();
      }
      _controllers = List.generate(
        widget.semesters.length,
        (i) => TextEditingController(text: widget.semesters[i]['term']),
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
                            semester['selected'] == true
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
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.mainOrange),
                          ),
                        ),
                        onChanged: (value) {
                          widget.semesters[index]['term'] = value;
                        },
                      ),
                    ),
                    horizontalSpace(38),
                    Text(
                      !semester['gpa'].toString().isNullOrEmpty()
                          ? semester['gpa']
                          : 'NEW',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color:
                            !semester['gpa'].toString().isNullOrEmpty()
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
