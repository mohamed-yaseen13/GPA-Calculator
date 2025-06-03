import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/logic/calculator_cubit.dart';

class CalculatorEqualRow extends StatelessWidget {
  final double calculatorHeight;

  const CalculatorEqualRow({super.key, required this.calculatorHeight});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: (MediaQuery.of(context).size.width - (7.sp * 2)),
          height: calculatorHeight / 6,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(0),
          ),
          child: Material(
            color: AppColors.lightOrange,
            child: InkWell(
              onTap: () => context.read<CalculatorCubit>().calculate(),
              child: Center(
                child: Text(
                  '=',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
