import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/routing/app_router.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model_type_adapter.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model_type_adapter.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model_type_adapter.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await ScreenUtil.ensureScreenSize();
  await dotenv.load(fileName: ".env");
  runApp(GpaApp());
}

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

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelTypeAdapter());
  Hive.registerAdapter(SemesterModelTypeAdapter());
  Hive.registerAdapter(CourseModelTypeAdapter());
  Box box = await Hive.openBox('studentData');
  box.put(
    'default',
    StudentModel(
      cgpa: 0,
      semesters: [
        SemesterModel(courses: [], gpa: 0, name: '', selected: false),
      ],
      totalCredits: 0,
    ),
  );
}
