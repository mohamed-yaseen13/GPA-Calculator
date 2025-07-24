import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradeField extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const GradeField({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4.sp),
        child: TextFormField(
          initialValue: value,
          maxLength: 2,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z\+\-]')),
            LengthLimitingTextInputFormatter(2),
          ],
          decoration: const InputDecoration(hintText: 'Grade', counterText: ''),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
