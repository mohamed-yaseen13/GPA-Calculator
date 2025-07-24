import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/section_full_mark_text_field.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/section_name_text_field.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/section_obtained_mark_text_field.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/submit_section_button.dart';

class AddSectionBottomSheet extends StatefulWidget {
  final String text;
  final String? initialName;
  final double? initialObtainedMark;
  final double? initialFullMark;
  final int index;

  const AddSectionBottomSheet({
    super.key,
    this.initialFullMark,
    this.initialObtainedMark,
    this.initialName,
    required this.text,
    this.index = -1,
  });

  @override
  State<AddSectionBottomSheet> createState() => _AddSectionBottomSheetState();
}

class _AddSectionBottomSheetState extends State<AddSectionBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _obtainedMarkController = TextEditingController();
  final _fullMarkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialName != null) {
      _nameController.text = widget.initialName!;
      _obtainedMarkController.text = widget.initialObtainedMark!.toString();
      _fullMarkController.text = widget.initialFullMark!.toString();
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
              '${widget.text} Section',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            verticalSpace(16),
            SectionNameTextField(controller: _nameController),
            verticalSpace(16),
            SectionObtainedMarkTextField(controller: _obtainedMarkController),
            verticalSpace(16),
            SectionFullMarkTextField(controller: _fullMarkController),
            verticalSpace(16),
            SubmitSectionButton(
              formKey: _formKey,
              nameController: _nameController,
              obtainedMarkController: _obtainedMarkController,
              fullMarkController: _fullMarkController,
              text: widget.text,
            ),
          ],
        ),
      ),
    );
  }
}
