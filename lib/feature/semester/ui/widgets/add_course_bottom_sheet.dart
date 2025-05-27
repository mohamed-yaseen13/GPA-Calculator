import 'package:flutter/material.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/course_credits_text_editing_controller.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/course_name_text_editing_controller.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/grade_drop_down.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/submit_course_button.dart';

class AddCourseBottomSheet extends StatefulWidget {
  const AddCourseBottomSheet({super.key});

  @override
  State<AddCourseBottomSheet> createState() => _AddCourseBottomSheetState();
}

class _AddCourseBottomSheetState extends State<AddCourseBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _creditController = TextEditingController();
  String _selectedGrade = '--';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add New Course',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            CourseNameTextEditingController(controller: _nameController),
            SizedBox(height: 16),
            CourseCreditsTextEditingController(controller: _creditController),
            SizedBox(height: 16),
            GradeDropDown(
              selectedGrade: _selectedGrade,
              onChanged: (value) {
                setState(() {
                  _selectedGrade = value!;
                });
              },
            ),
            SizedBox(height: 24),
            SubmitCourseButton(
              formKey: _formKey,
              nameController: _nameController,
              creditController: _creditController,
              selectedGrade: _selectedGrade,
            ),
          ],
        ),
      ),
    );
  }
}
