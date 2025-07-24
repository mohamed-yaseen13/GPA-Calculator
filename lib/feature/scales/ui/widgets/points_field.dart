import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointsField extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const PointsField({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4.sp),
        child: TextFormField(
          initialValue: value,
          decoration: const InputDecoration(hintText: 'Points'),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}
