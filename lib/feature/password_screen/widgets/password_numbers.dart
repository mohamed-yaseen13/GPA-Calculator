import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/password_screen/logic/password_cubit.dart';

class PasswordNumbers extends StatelessWidget {
  final VoidCallback onPasswordCorrect;

  const PasswordNumbers({super.key, required this.onPasswordCorrect});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          if (index == 9) {
            return TextButton(
              onPressed: () => context.pop(),
              child: const Text('EXIT', style: TextStyle(color: Colors.black)),
            );
          } else if (index == 11) {
            return TextButton(
              onPressed: context.read<PasswordCubit>().deleteLastDigit,
              child: const Text('DEL', style: TextStyle(color: Colors.black)),
            );
          } else {
            final number = index == 10 ? 0 : index + 1;
            return TextButton(
              onPressed:
                  () => context.read<PasswordCubit>().addDigit(
                    number.toString(),
                    onPasswordCorrect,
                  ),
              child: Text(
                number.toString(),
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainOrange,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
