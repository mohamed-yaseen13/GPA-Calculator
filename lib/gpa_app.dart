import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/routing/app_router.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/password_screen/logic/password_cubit.dart';
import 'package:gpa_calculator/feature/password_screen/password_gate.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';

class GpaApp extends StatelessWidget {
  final bool isPasswordNull;

  const GpaApp({super.key, required this.isPasswordNull});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => getIt<GpaCalculationsCubit>(),
          child: MaterialApp(
            home: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => getIt<PasswordCubit>()),
                BlocProvider.value(value: getIt<SettingsCubit>()),
              ],
              child: PasswordGate(),
            ),
            theme: ThemeData(
              scaffoldBackgroundColor: Color(0xFFFFF6E7),
              appBarTheme: AppBarTheme(
                color: AppColors.mainOrange,
                titleTextStyle: TextStyle(fontSize: 18.sp, color: Colors.white),
                iconTheme: const IconThemeData(color: Colors.white),
              ),
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: isPasswordNull ? AppRoutes.applicationAppBar : null,
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      },
    );
  }
}
