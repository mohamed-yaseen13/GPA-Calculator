import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';

class EditScaleButton extends StatelessWidget {
  final String title;
  final List<List<String>> scale;
  final int index;

  const EditScaleButton({
    super.key,
    required this.title,
    required this.scale,
    required this.index,
  });

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
        'Edit Scale',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      onPressed: () async {
        final result = await context.pushNamed(
          AppRoutes.customScaleScreen,
          arguments: {
            'title': title,
            'rows': List<List<String>>.from(
              scale.map((e) => List<String>.from(e)),
            ),
            'index': index,
          },
        );
        if (result is Map<String, dynamic>) {
          context.read<ScalesCubit>().addCustomScale(result, index: index);
        }
      },
    );
  }
}
