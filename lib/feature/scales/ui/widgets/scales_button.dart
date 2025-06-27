import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScalesButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const ScalesButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: color),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(12.sp),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
