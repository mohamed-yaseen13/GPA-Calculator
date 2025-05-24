import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_state.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/scales_list.dart';

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
                  ScalesList(
                    index: 0,
                    title: '4.00 Scale',
                    scales: Scales.scales1,
                  ),
                  ScalesList(
                    index: 1,
                    title: '4.33 Scale',
                    scales: Scales.scales2,
                  ),
                  ScalesList(
                    index: 2,
                    title: '0.70 Scale',
                    scales: Scales.scales3,
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
