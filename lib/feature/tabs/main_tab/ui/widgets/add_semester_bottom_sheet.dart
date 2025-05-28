import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/semester_name_text_field.dart';

class AddSemesterBottomSheet extends StatefulWidget {
  final String text;
  final String? initialName;
  const AddSemesterBottomSheet({
    super.key,
    required this.text,
    this.initialName,
  });

  @override
  State<AddSemesterBottomSheet> createState() => _AddSemesterBottomSheetState();
}

class _AddSemesterBottomSheetState extends State<AddSemesterBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialName != null) {
      _nameController.text = widget.initialName!;
    }
  }

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
              '${widget.text} Semester',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            verticalSpace(16),
            SemesterNameTextField(controller: _nameController),
            verticalSpace(24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.pop({'name': _nameController.text});
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainOrange,
                foregroundColor: Colors.white,
              ),
              child: Text('${widget.text} Semester'),
            ),
          ],
        ),
      ),
    );
  }
}
