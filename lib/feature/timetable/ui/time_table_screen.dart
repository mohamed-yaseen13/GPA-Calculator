import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/widgets/app_drawer.dart';
import 'package:gpa_calculator/feature/timetable/ui/widgets/time_table_body.dart';

class TimeTableScreen extends StatelessWidget {
  const TimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Time Table',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const AppDrawer(selectedRoute: DrawerRoute.timeTable),
      body: const TimeTableBody(),
    );
  }
}
