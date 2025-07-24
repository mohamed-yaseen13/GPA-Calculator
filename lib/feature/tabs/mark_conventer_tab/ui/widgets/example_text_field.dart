import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';

class ExampleTextField extends StatelessWidget {
  final String value, text;
  const ExampleTextField({super.key, required this.value, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        verticalSpace(8),
        Container(
          width: MediaQuery.of(context).size.width / 2 - 28.w,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black26, width: 1)),
          ),
          child: Text(
            value,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
