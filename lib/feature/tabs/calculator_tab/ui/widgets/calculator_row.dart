import 'package:flutter/material.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/ui/widgets/calculator_element_in_row_container.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/ui/widgets/calculator_last_element_in_row_container.dart';

class CalculatorRow extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;

  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final VoidCallback onTap3;
  final VoidCallback onTap4;

  final String text1;
  final String text2;
  final String text3;
  final String text4;

  final double calculatorHeight;

  const CalculatorRow({
    super.key,
    required this.calculatorHeight,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
    required this.onTap4,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CalculatorElementInRowContainer(
          calculatorHeight: calculatorHeight,
          color: color1,
          onTap: onTap1,
          text: text1,
        ),
        CalculatorElementInRowContainer(
          calculatorHeight: calculatorHeight,
          color: color2,
          onTap: onTap2,
          text: text2,
        ),
        CalculatorElementInRowContainer(
          calculatorHeight: calculatorHeight,
          color: color3,
          onTap: onTap3,
          text: text3,
        ),
        CalculatorLastElementInRowContainer(
          calculatorHeight: calculatorHeight,
          color: color4,
          onTap: onTap4,
          text: text4,
        ),
      ],
    );
  }
}
