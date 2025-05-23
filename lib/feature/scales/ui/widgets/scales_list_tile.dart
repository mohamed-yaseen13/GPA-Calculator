import 'package:flutter/material.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/scales_grade_table.dart';

class ScalesListTile extends StatefulWidget {
  const ScalesListTile({super.key});

  @override
  State<ScalesListTile> createState() => _ScalesListTileState();
}

class _ScalesListTileState extends State<ScalesListTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 300,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                  color: isSelected ? Colors.black : Colors.white,
                ),
              ),
              title: Text('Custom Scale'),
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            ),
          ),
        ),
        if (isSelected) ScalesGradeTable(),
      ],
    );
  }
}
