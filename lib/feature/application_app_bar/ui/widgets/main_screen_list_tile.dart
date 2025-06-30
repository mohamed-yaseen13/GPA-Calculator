import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/ui/application_app_bar.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/logic/calculator_cubit.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/logic/converter_cubit.dart';

class MainScreenListTile extends StatelessWidget {
  const MainScreenListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[400],
      title: Text('Main Dashboard', style: TextStyle(fontSize: 16.sp)),
      onTap: () {
        print('Navigate To Main Screen');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<ApplicationAppBarCubit>(
                      create:
                          (_) => ApplicationAppBarCubit(
                            box: AppConstants.box,
                            student: AppConstants.student,
                          ),
                    ),
                    BlocProvider(create: (_) => getIt<ConverterCubit>()),
                    BlocProvider(create: (_) => getIt<CalculatorCubit>()),
                  ],
                  child: ApplicationAppBar(),
                ),
          ),
        );
      },
    );
  }
}
