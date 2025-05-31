import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';

class DeleteScaleButton extends StatelessWidget {
  final int index;

  const DeleteScaleButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text('Delete Scale'),
      onPressed: () {
        context.read<ScalesCubit>().deleteScale(index);
      },
    );
  }
}
