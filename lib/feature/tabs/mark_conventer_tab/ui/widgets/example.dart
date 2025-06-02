import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/ui/widgets/example_text_field.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'For example, if you got 23/25 in a test, and you want to convert that result to a total of 100 (Percentage value), you will do the following:',
            style: TextStyle(fontSize: 14.sp),
          ),
          verticalSpace(16),
          Row(
            children: [
              Expanded(child: ExampleTextField(text: 'You got :', value: '23')),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text('/'),
              ),
              Expanded(
                child: ExampleTextField(text: 'From a total of :', value: '25'),
              ),
            ],
          ),
          verticalSpace(24),
          Row(
            children: [
              Expanded(
                child: ExampleTextField(
                  text: 'Converted Result :',
                  value: '92',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text('/'),
              ),
              Expanded(
                child: ExampleTextField(text: 'From a total of:', value: '100'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
