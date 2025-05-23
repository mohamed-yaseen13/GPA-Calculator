import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/constants/scales.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/scales_list.dart';

class ScalesScreen extends StatelessWidget {
  const ScalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scales')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ScalesList(title: '4.00 Scale', scales: Scales.scales1),
              ScalesList(title: '4.33 Scale', scales: Scales.scales2),
              ScalesList(title: '0.70 Scale', scales: Scales.scales3),
              //ScalesList(title: 'Custom Scale'),
            ],
          ),
        ),
      ),
    );
  }
}
