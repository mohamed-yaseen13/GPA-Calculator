import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_state.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/scale_container.dart';

class ScalesScreen extends StatelessWidget {
  const ScalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scales')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocBuilder<ScalesCubit, ScalesState>(
            builder: (context, state) {
              return Column(
                children: [
                  ScaleContainer(
                    index: 0,
                    title: '4.00 Scale',
                    scales: Scales.scale1,
                  ),
                  ScaleContainer(
                    index: 1,
                    title: '4.33 Scale',
                    scales: Scales.scale2,
                  ),
                  ScaleContainer(
                    index: 2,
                    title: '0.70 Scale',
                    scales: Scales.scale3,
                  ),
                  //ScalesList(title: 'Custom Scale'),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
