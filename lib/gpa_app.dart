import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/routing/app_router.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';

class GpaApp extends StatelessWidget {
  const GpaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocProvider(
          create:
              (_) => GpaCalculationsCubit(
                box: AppConstants.box,
                student: AppConstants.student,
                scale: Scales.scales1,
              ),
          child: MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                color: AppColors.mainOrange,
                titleTextStyle: TextStyle(fontSize: 18.sp, color: Colors.white),
                iconTheme: const IconThemeData(color: Colors.white),
              ),
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.applicationAppBar,
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      },
    );
  }
}
