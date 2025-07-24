import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';

class TotalMarkColumn extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const TotalMarkColumn({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 28.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('From a total of :', style: TextStyle(fontSize: 16.sp)),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.mainOrange),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
