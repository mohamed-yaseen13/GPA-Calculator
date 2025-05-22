import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';

class SemesterScreenAppBarDropDownMenu extends StatelessWidget {
  String? selectedTerm;
  List<SemesterModel> semesters;
  ValueChanged<String?> onChanged;
  double? dropdownWidth;
  SemesterScreenAppBarDropDownMenu({
    super.key,
    required this.selectedTerm,
    required this.semesters,
    required this.onChanged,
    required this.dropdownWidth,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: DropdownButton<String>(
          value: selectedTerm!.isEmpty ? null : selectedTerm,
          hint: Text('Term Name', style: TextStyle(color: Colors.white60)),
          dropdownColor: Color(0xFF303030),
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
          items:
              semesters.map((semester) {
                return DropdownMenuItem<String>(
                  value: semester.name,
                  child: Text(
                    semester.name,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
          onChanged: onChanged,
          menuWidth: dropdownWidth,
          icon: Padding(
            padding: EdgeInsets.only(left: 64.w),
            child: Icon(Icons.arrow_drop_down, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
