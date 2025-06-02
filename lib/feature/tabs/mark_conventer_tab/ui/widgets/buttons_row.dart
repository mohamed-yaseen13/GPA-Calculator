import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/logic/converter_cubit.dart';

class ButtonsRow extends StatelessWidget {
  final TextEditingController obtainedMardController;
  final TextEditingController totalMardController;
  final TextEditingController converterMarkController;

  const ButtonsRow({
    super.key,
    required this.converterMarkController,
    required this.obtainedMardController,
    required this.totalMardController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48.h,
            child: ElevatedButton(
              onPressed:
                  context.read<ConverterCubit>().calculateConvertedResult,
              child: Text("Calculate"),
            ),
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: SizedBox(
            height: 48.h,
            child: ElevatedButton(
              onPressed: () {
                obtainedMardController.clear();
                totalMardController.clear();
                converterMarkController.clear();
                context.read<ConverterCubit>().reset();
              },
              child: Text("Reset"),
            ),
          ),
        ),
      ],
    );
  }
}
