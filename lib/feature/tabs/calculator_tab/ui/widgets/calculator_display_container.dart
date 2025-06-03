import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/logic/calculator_cubit.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/logic/calculator_state.dart';

class CalculatorDisplayContainer extends StatelessWidget {
  const CalculatorDisplayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 94.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: BlocBuilder<CalculatorCubit, CalculatorState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  state.expression,
                  style: TextStyle(fontSize: 24.sp, color: Colors.black54),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  state.displayValue,
                  style: TextStyle(
                    fontSize: 32.sp,
                    color: state.isError ? Colors.red : Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
