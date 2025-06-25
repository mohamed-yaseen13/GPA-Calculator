import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/logic/calculator_cubit.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/ui/widgets/calculator_equal_row.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/ui/widgets/calculator_row.dart';

class CalculatorButtonsContainer extends StatelessWidget {
  const CalculatorButtonsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final double calculatorHeight =
        MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        (2 * kToolbarHeight) -
        kTextTabBarHeight -
        (6.sp * 2) -
        6.h -
        94.h;

    return Container(
      width: double.infinity,
      height: calculatorHeight,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: [
          CalculatorRow(
            calculatorHeight: calculatorHeight - 2.sp,
            color1: Colors.white,
            onTap1: () => context.read<CalculatorCubit>().inputSymbol('('),
            text1: '(',

            color2: Colors.white,
            onTap2: () => context.read<CalculatorCubit>().inputSymbol(')'),
            text2: ')',

            color3: AppColors.darkOrange,
            onTap3: () => context.read<CalculatorCubit>().delete(),
            text3: 'DEL',

            color4: AppColors.darkOrange,
            onTap4: () => context.read<CalculatorCubit>().clear(),
            text4: 'AC',
          ),
          CalculatorRow(
            calculatorHeight: calculatorHeight - 2.sp,
            color1: Colors.white,
            onTap1: () => context.read<CalculatorCubit>().inputNumber('7'),
            text1: '7',

            color2: Colors.white,
            onTap2: () => context.read<CalculatorCubit>().inputNumber('8'),
            text2: '8',

            color3: Colors.white,
            onTap3: () => context.read<CalculatorCubit>().inputNumber('9'),
            text3: '9',

            color4: AppColors.lightOrange,
            onTap4: () => context.read<CalculatorCubit>().inputSymbol('÷'),
            text4: '÷',
          ),
          CalculatorRow(
            calculatorHeight: calculatorHeight - 2.sp,
            color1: Colors.white,
            onTap1: () => context.read<CalculatorCubit>().inputNumber('4'),
            text1: '4',

            color2: Colors.white,
            onTap2: () => context.read<CalculatorCubit>().inputNumber('5'),
            text2: '5',

            color3: Colors.white,
            onTap3: () => context.read<CalculatorCubit>().inputNumber('6'),
            text3: '6',

            color4: AppColors.lightOrange,
            onTap4: () => context.read<CalculatorCubit>().inputSymbol('×'),
            text4: '×',
          ),
          CalculatorRow(
            calculatorHeight: calculatorHeight - 2.sp,
            color1: Colors.white,
            onTap1: () => context.read<CalculatorCubit>().inputNumber('1'),
            text1: '1',

            color2: Colors.white,
            onTap2: () => context.read<CalculatorCubit>().inputNumber('2'),
            text2: '2',

            color3: Colors.white,
            onTap3: () => context.read<CalculatorCubit>().inputNumber('3'),
            text3: '3',

            color4: AppColors.lightOrange,
            onTap4: () => context.read<CalculatorCubit>().inputSymbol('-'),
            text4: '-',
          ),
          CalculatorRow(
            calculatorHeight: calculatorHeight - 2.sp,
            color1: Colors.white,
            onTap1: () => context.read<CalculatorCubit>().inputNumber('0'),
            text1: '0',

            color2: Colors.white,
            onTap2: () => context.read<CalculatorCubit>().inputNumber('.'),
            text2: '.',

            color3: Colors.white,
            onTap3: () => context.read<CalculatorCubit>().percentage(),
            text3: '%',

            color4: AppColors.lightOrange,
            onTap4: () => context.read<CalculatorCubit>().inputSymbol('+'),
            text4: '+',
          ),
          CalculatorEqualRow(calculatorHeight: calculatorHeight - 2.sp),
        ],
      ),
    );
  }
}
