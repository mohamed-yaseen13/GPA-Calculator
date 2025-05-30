import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';

class SectionObtainedMarkTextField extends StatelessWidget {
  final TextEditingController controller;
  const SectionObtainedMarkTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      decoration: InputDecoration(
        labelText: 'Obtained Mark',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainOrange),
        ),
      ),
    );
  }
}
