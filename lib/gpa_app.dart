import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/routing/app_router.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';

class GpaApp extends StatelessWidget {
  final int selectedScaleIndex;
  final List<Map<String, dynamic>> customScales;

  const GpaApp({
    super.key,
    required this.selectedScaleIndex,
    required this.customScales,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
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
        );
      },
    );
  }
}
