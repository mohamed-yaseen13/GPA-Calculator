import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';

class ScalesGradeTable extends StatelessWidget {
  final List<List<String>> scale;
  const ScalesGradeTable({super.key, required this.scale});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
      child: Table(
        border: TableBorder.all(),
        columnWidths: const {
          0: FractionColumnWidth(0.32),
          1: FractionColumnWidth(0.34),
          2: FractionColumnWidth(0.32),
        },
        children: [
          buildRow([
            'Grade',
            'Percentage',
            'Points',
          ], color: AppColors.lightOrange),
          ...scale.map((scale) => buildRow(scale)),
        ],
      ),
    );
  }
}

TableRow buildRow(List<String> cells, {Color? color}) => TableRow(
  children:
      cells.map((cell) {
        final style = TextStyle(fontSize: 18.sp);
        return Container(
          color: color,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
            child: Center(child: Text(cell, style: style)),
          ),
        );
      }).toList(),
);
