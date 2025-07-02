import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScenariosRowHeader extends StatelessWidget {
  const ScenariosRowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text('#', style: TextStyle(fontSize: 16.sp))),
        Expanded(
          flex: 7,
          child: Text(
            'Scenarios',
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(flex: 6, child: SizedBox()),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
