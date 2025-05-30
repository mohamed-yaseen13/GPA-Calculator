import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';

class SectionFullMarkTextField extends StatelessWidget {
  final TextEditingController controller;
  const SectionFullMarkTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      decoration: InputDecoration(
        labelText: 'Full Mark',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainOrange),
        ),
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter Mark';
        }
        return null;
      },
    );
  }
}
