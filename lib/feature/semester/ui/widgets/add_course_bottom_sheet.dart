import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/course_credits_text_field.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/course_name_text_field.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/grade_drop_down.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/submit_course_button.dart';

class AddCourseBottomSheet extends StatefulWidget {
  final String text;
  final String? initialName;
  final String? initialGrade;
  final double? initialCredits;
  final int index;

  const AddCourseBottomSheet({
    super.key,
    this.initialCredits,
    this.initialGrade,
    this.initialName,
    required this.text,
    this.index = -1,
  });

  @override
  State<AddCourseBottomSheet> createState() => _AddCourseBottomSheetState();
}

class _AddCourseBottomSheetState extends State<AddCourseBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _creditController = TextEditingController();
  String _selectedGrade = '--';

  @override
  void initState() {
    super.initState();
    if (widget.initialName != null) {
      _nameController.text = widget.initialName!;
      _creditController.text = widget.initialCredits!.toString();
      _selectedGrade = widget.initialGrade!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${widget.text} Course',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            verticalSpace(16),
            CourseNameTextField(
              controller: _nameController,
              index: widget.index,
            ),
            verticalSpace(16),
            CourseCreditsTextField(controller: _creditController),
            verticalSpace(16),
            GradeDropDown(
              selectedGrade: _selectedGrade,
              onChanged: (value) {
                setState(() {
                  _selectedGrade = value!;
                });
              },
            ),
            verticalSpace(16),
            SubmitCourseButton(
              text: widget.text,
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
