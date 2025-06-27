import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';

class SaveScaleButton extends StatelessWidget {
  final TextEditingController titleController;
  final List<List<String>> rows;
  final int? editIndex;

  const SaveScaleButton({
    super.key,
    required this.titleController,
    required this.rows,
    this.editIndex,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.green),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(12.sp),
        ),
      ),
      onPressed: () async {
        final cubit = context.read<ScalesCubit>();
        final error = await cubit.saveCustomScaleWithValidation(
          titleController.text,
          rows,
        );
        if (error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error)));
          return;
        }
        context.pop({
          'title': titleController.text,
          'scale': rows,
          if (editIndex != null) 'index': editIndex,
        });
      },
      child: Text(
        editIndex != null ? 'Save Changes' : 'Save Scale',
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
    );
  }
}
