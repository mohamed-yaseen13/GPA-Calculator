import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorLastElementInRowContainer extends StatelessWidget {
  final double calculatorHeight;
  final Color color;
  final VoidCallback onTap;
  final String text;

  const CalculatorLastElementInRowContainer({
    super.key,
    required this.calculatorHeight,
    required this.color,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - (7.sp * 2)) / 4,
      height: calculatorHeight / 6,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border(bottom: BorderSide(color: Colors.black, width: 1.w)),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Material(
        color: color,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 24.sp, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
