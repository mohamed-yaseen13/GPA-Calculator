import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/logic/converter_cubit.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/logic/converter_state.dart';

class ResualtMarkColumn extends StatelessWidget {
  final TextEditingController controller;

  const ResualtMarkColumn({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 28.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Converted Result:', style: TextStyle(fontSize: 16.sp)),
          BlocBuilder<ConverterCubit, ConverterState>(
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: true,
                child: TextField(
                  controller: TextEditingController(
                    text: state.convertedResult,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.mainOrange),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
