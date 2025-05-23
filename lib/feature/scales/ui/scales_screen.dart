import 'package:flutter/material.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/scales_list_tile.dart';

class ScalesScreen extends StatelessWidget {
  const ScalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scales')),
      body: Column(children: [ScalesListTile()]),
    );
  }
}
