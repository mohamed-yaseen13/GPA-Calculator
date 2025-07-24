import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';

class DeleteScaleButton extends StatelessWidget {
  final int index;

  const DeleteScaleButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.black),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(12.sp),
        ),
      ),
      child: const Text(
        'Delete Scale',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        context.read<ScalesCubit>().deleteScale(index);
      },
    );
  }
}
