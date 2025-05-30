import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionRowHeader extends StatelessWidget {
  const SectionRowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text('#', style: TextStyle(fontSize: 16.sp))),
        Expanded(
          flex: 7,
          child: Text(
            'Sections',
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            'You Got',
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            'From',
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
