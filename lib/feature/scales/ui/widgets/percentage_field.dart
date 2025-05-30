import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';

class PercentageField extends StatelessWidget {
  final String value;
  final int rowIndex;
  final List<List<String>> rows;
  final ValueChanged<String> onChanged;

  const PercentageField({
    super.key,
    required this.value,
    required this.rowIndex,
    required this.rows,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4.sp),
        child: TextFormField(
          initialValue: value,
          decoration: InputDecoration(
            hintText: 'xx-yy',
            errorText: context.read<ScalesCubit>().validatePercentile(
              value,
              rowIndex,
              rows,
            ),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[\d\-]')),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}
