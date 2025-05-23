import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/scales_header_cell.dart';

class ScalesGradeTable extends StatelessWidget {
  const ScalesGradeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Table(
        children: [
          TableRow(
            decoration: BoxDecoration(color: AppColors.lightOrange),
            children: [
              ScalesHeaderCell(text: 'Grade'),
              ScalesHeaderCell(text: 'Percentage'),
              ScalesHeaderCell(text: 'Points'),
            ],
          ),
          _buildTableRow('A+', '97–100', '4'),
          _buildTableRow('A', '93–97', '4'),
        ],
      ),
    );
  }
}

TableRow _buildTableRow(String grade, String percentile, String points) {
  return TableRow(
    children: [
      Padding(padding: EdgeInsets.all(8.0), child: Text(grade)),
      Padding(padding: EdgeInsets.all(8.0), child: Text(percentile)),
      Padding(padding: EdgeInsets.all(8.0), child: Text(points)),
    ],
  );
}
