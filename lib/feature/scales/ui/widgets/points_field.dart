import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';

class PointsField extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const PointsField({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4.sp),
        child: TextFormField(
          initialValue: value,
          decoration: InputDecoration(
            hintText: 'Points',
            errorText: context.read<ScalesCubit>().validatePoint(value),
          ),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}
