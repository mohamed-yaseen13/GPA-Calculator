import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/functions.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_screen_body.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SemesterScreen extends StatefulWidget {
  const SemesterScreen({super.key});

  @override
  State<SemesterScreen> createState() => _SemesterScreenState();
}

class _SemesterScreenState extends State<SemesterScreen> {
  String? selectedTerm;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    int? index = args?['semesterIndex'];

    final box = Hive.box('studentData');
    final student = box.get('default');
    final List<SemesterModel> semesters = student.semesters;

    final textStyle = TextStyle(color: Colors.white, fontSize: 16.sp);
    final double dropdownWidth =
        getMaxSemesterNameWidth(semesters, textStyle) + 32.w;

    if (selectedTerm == null && index != null) {
      selectedTerm = semesters[index].name;
      selectedIndex = index;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainOrange,
        title: DropdownButtonHideUnderline(
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
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedTerm = value;
                    selectedIndex = semesters.indexWhere(
                      (semester) => semester.name == value,
                    );
                  });
                }
              },
              menuWidth: dropdownWidth,
              icon: Padding(
                padding: EdgeInsets.only(left: 64.w),
                child: Icon(Icons.arrow_drop_down, color: Colors.white),
              ),
            ),
          ),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Text('SELECT', style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.note, color: Colors.white),
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            itemBuilder:
                (context) => [
                  PopupMenuItem(value: 1, child: Text('Settings')),
                  PopupMenuItem(value: 2, child: Text('Scales')),
                ],
            onSelected: (value) {},
          ),
        ],
      ),
      body: SemesterScreenBody(box: box, index: selectedIndex),
    );
  }
}
