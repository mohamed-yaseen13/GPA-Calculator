import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/functions.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SemesterScreenBody extends StatefulWidget {
  final Box box;
  final int index;
  const SemesterScreenBody({super.key, required this.box, required this.index});

  @override
  State<SemesterScreenBody> createState() => _SemesterScreenBodyState();
}

class _SemesterScreenBodyState extends State<SemesterScreenBody> {
  List<TextEditingController> _nameControllers = [];
  List<TextEditingController> _creditControllers = [];

  final List<String> _grades = [
    '--',
    'A+',
    'A',
    'A-',
    'B+',
    'B',
    'B-',
    'C+',
    'C',
    'C-',
    'D+',
    'D',
    'F',
    'Fr',
  ];

  @override
  void initState() {
    super.initState();
    final student = widget.box.get('default');
    final courses = student.semesters[widget.index].courses;
    _nameControllers = List.generate(
      courses.length,
      (i) => TextEditingController(text: courses[i].name),
    );
    _creditControllers = List.generate(
      courses.length,
      (i) => TextEditingController(text: courses[i].credits.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    StudentModel student = widget.box.get('default');
    List<SemesterModel> semesters = student.semesters;
    List<CourseModel> courses = semesters[widget.index].courses;

    if (_nameControllers.length != courses.length) {
      for (var c in _nameControllers) {
        c.dispose();
      }
      _nameControllers = List.generate(
        courses.length,
        (i) => TextEditingController(text: courses[i].name),
      );
    }

    if (_creditControllers.length != courses.length) {
      for (var c in _creditControllers) {
        c.dispose();
      }
      _creditControllers = List.generate(
        courses.length,
        (i) => TextEditingController(text: courses[i].name),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/graduation_hat_2.svg'),
                  horizontalSpace(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('GPA: ', style: TextStyle(fontSize: 18.sp)),
                      Text(
                        '${semesters[widget.index].gpa}',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('#', style: TextStyle(fontSize: 16.sp)),
                  horizontalSpace(32),
                  Text('Courses', style: TextStyle(fontSize: 16.sp)),
                  horizontalSpace(42),
                  Text('Grades', style: TextStyle(fontSize: 16.sp)),
                  horizontalSpace(64),
                  Text('Creidts', style: TextStyle(fontSize: 16.sp)),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: widget.box.listenable(),
              builder: (context, Box box, _) {
                return Column(
                  children:
                      courses.asMap().entries.map((entry) {
                        final index = entry.key;
                        //final course = entry.value;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              horizontalSpace(16),
                              Text(
                                '${index + 1}',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              horizontalSpace(16),
                              Expanded(
                                child: TextFormField(
                                  controller: _nameControllers[index],
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(20),
                                  ],
                                  decoration: InputDecoration(
                                    hintText: 'Course Name',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.mainOrange,
                                      ),
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
                                      _grades.map((grade) {
                                        return DropdownMenuItem<String>(
                                          value: grade,
                                          child: Text(grade),
                                        );
                                      }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
                                        courses[index].grade = value;
                                      });
                                    }
                                  },
                                ),
                              ),
                              horizontalSpace(16),
                              Expanded(
                                child: TextFormField(
                                  controller: _creditControllers[index],
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
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.mainOrange,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    double val = double.tryParse(value) ?? 0;
                                    if (val > 10) {
                                      val = 10;
                                      _creditControllers[index].text = '10';
                                      _creditControllers[index].selection =
                                          TextSelection.fromPosition(
                                            TextPosition(
                                              offset:
                                                  _creditControllers[index]
                                                      .text
                                                      .length,
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
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addCourse(widget.index);
          setState(() {});
          printStudentData();
        },
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}

void addCourse(int index) {
  final box = Hive.box('studentData');
  StudentModel student = box.get('default');

  CourseModel newCourse = CourseModel(
    grade: '--',
    name: '',
    selected: false,
    credits: 1,
  );

  student.semesters[index].courses.add(newCourse);

  box.put('default', student);
}
