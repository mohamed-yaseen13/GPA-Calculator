import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';

class AddSemesterBottomSheet extends StatefulWidget {
  const AddSemesterBottomSheet({super.key});

  @override
  State<AddSemesterBottomSheet> createState() => _AddSemesterBottomSheetState();
}

class _AddSemesterBottomSheetState extends State<AddSemesterBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
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
              'Add New Semester',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            verticalSpace(16),
            TextFormField(
              controller: _nameController,
              inputFormatters: [LengthLimitingTextInputFormatter(15)],
              decoration: InputDecoration(
                labelText: 'Semester Name',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mainOrange),
                ),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter Semester name';
                }
                for (var semester
                    in context.read<ApplicationAppBarCubit>().state.semesters) {
                  if (semester.name == value) {
                    return 'Semester already exists';
                  }
                }
                return null;
              },
            ),
            verticalSpace(24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context, {'name': _nameController.text});
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainOrange,
                foregroundColor: Colors.white,
              ),
              child: Text('Add Semester'),
            ),
          ],
        ),
      ),
    );
  }
}
