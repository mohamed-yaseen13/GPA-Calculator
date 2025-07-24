import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/scenario_name_text_field.dart';

class AddScenarioBottomShett extends StatefulWidget {
  final String text;
  final String? initialName;

  const AddScenarioBottomShett({
    super.key,
    this.initialName,
    required this.text,
  });

  @override
  State<AddScenarioBottomShett> createState() => _AddScenarioBottomShettState();
}

class _AddScenarioBottomShettState extends State<AddScenarioBottomShett> {
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
      padding: EdgeInsets.all(16.sp),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${widget.text} Scenario',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            verticalSpace(16),
            ScenarioNameTextField(controller: _nameController),
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
              child: Text('${widget.text} Scenario'),
            ),
          ],
        ),
      ),
    );
  }
}
