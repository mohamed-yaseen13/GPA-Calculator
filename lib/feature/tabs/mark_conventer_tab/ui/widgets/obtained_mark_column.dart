import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/logic/converter_cubit.dart';

class ObtainedMarkColumn extends StatelessWidget {
  final TextEditingController controller;

  const ObtainedMarkColumn({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 28.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('You got :', style: TextStyle(fontSize: 16.sp)),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: context.read<ConverterCubit>().updateObtained,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                  decoration: InputDecoration(
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
