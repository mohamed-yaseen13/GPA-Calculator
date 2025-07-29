import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/core/widgets/app_drawer.dart';
import 'package:gpa_calculator/feature/calendar/data/models/event_model.dart';
import 'package:gpa_calculator/feature/scenarios/data/models/scenario_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:gpa_calculator/table_calendar/lib/table_calendar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart' show DateFormat;

void printStudentData({StudentModel? student}) {
  final currentStudent = student ?? AppConstants.student;

  for (var semester in currentStudent.semesters) {
    print('${semester.name} - ${semester.note}');
    print('');
    print('CGPA Original: ${semester.cgpaOriginal}');
    print('');
    print('CGPA Changed: ${semester.cgpaChanged}');

    for (var course in semester.courses) {
      print(
        '${course.name} - repeated: ${course.isRepeated} - changed: ${course.isChanged} - Grade: ${course.grade} - New Grade: ${course.newGrade} Failed Before ${course.isFailedBefore}',
      );

      for (var section in course.sections) {
        print(
          '${section.name} - ${section.obtainedMark} - ${section.fullMark}',
        );
      }
    }
  }
}

void printScenariosData() {
  for (var scenario in AppConstants.scenarios) {
    print(scenario.name);
    printStudentData(student: scenario.student);
  }
}

double getMaxSemesterNameWidth(List<dynamic> semesters) {
  double maxWidth1 = 0;

  for (var semester in semesters) {
    if (semester.name.isEmpty) {
      maxWidth1 = 130;
    }
  }

  double maxWidth2 = 0;
  for (var semester in semesters) {
    final tp = TextPainter(
      text: TextSpan(
        text: semester.name,
        style: TextStyle(color: Colors.white, fontSize: 16.sp),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    if (tp.size.width > maxWidth2) maxWidth2 = tp.size.width;
  }

  if (maxWidth1 < maxWidth2) {
    return maxWidth2 + 32.w;
  }

  return maxWidth1;
}

void updateScenariosBox(Box box, int scenarioIndex, StudentModel student) {
  final scenariosBox = box;
  final oldScenario = scenariosBox.getAt(scenarioIndex) as ScenarioModel;
  final updatedScenario = oldScenario.copyWith(student: student);
  scenariosBox.putAt(scenarioIndex, updatedScenario);
}

T getCubit<T extends Object>() {
  if (AppConstants.isScenarioMode) {
    return getIt<T>(instanceName: 'scenario');
  } else {
    return getIt<T>();
  }
}

void handleRouteSelected(BuildContext context, DrawerRoute route) async {
  if (route == DrawerRoute.main) {
    AppConstants.isScenarioMode = false;
    await resetMainCubits();
    context.pushReplacementNamed(AppRoutes.applicationAppBar);
  } else if (route == DrawerRoute.scenarios) {
    AppConstants.isScenarioMode = true;
    await resetScenarioCubits();
    context.pushReplacementNamed(AppRoutes.scenariosScreen);
  } else if (route == DrawerRoute.calendar) {
    context.pushReplacementNamed(AppRoutes.calendarScreen);
  } else if (route == DrawerRoute.timeTable) {
    context.pushReplacementNamed(AppRoutes.timeTable);
  }
}

Future<void> updateCalendarWidgetFromHive() async {
  final box = Hive.box('events');
  final now = DateTime.now();
  final currentMonth = DateTime(now.year, now.month);

  final String monthName = DateFormat('MMMM yyyy').format(currentMonth);
  await HomeWidget.saveWidgetData('month_title', monthName);

  final firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);

  const int saturdayIndex = DateTime.saturday;
  final int firstWeekday = firstDayOfMonth.weekday;
  final int offset = (firstWeekday - saturdayIndex + 7) % 7;

  final startDate = firstDayOfMonth.subtract(Duration(days: offset));

  for (int i = 0; i < 35; i++) {
    final dayDate = startDate.add(Duration(days: i));
    final keyBase = 'day_${i + 1}';

    await HomeWidget.saveWidgetData(
      '${keyBase}_number',
      dayDate.day.toString(),
    );

    await HomeWidget.saveWidgetData(
      '${keyBase}_date',
      dayDate.toIso8601String(),
    );

    await HomeWidget.saveWidgetData(
      '${keyBase}_isDim',
      (dayDate.month == currentMonth.month) ? 'false' : 'true',
    );

    final events =
        box.values
            .cast<EventModel>()
            .where((e) => isSameDay(e.date, dayDate))
            .toList();

    if (events.isNotEmpty) {
      final firstTitle = events.first.title;
      final extraCount = events.length - 1;

      // First line: actual event title
      await HomeWidget.saveWidgetData('${keyBase}_event_line1', firstTitle);

      // Second line: extra event count (or blank)
      final secondLine = extraCount > 0 ? '+$extraCount' : '';
      await HomeWidget.saveWidgetData('${keyBase}_event_line2', secondLine);
    } else {
      await HomeWidget.saveWidgetData('${keyBase}_event_line1', '');
      await HomeWidget.saveWidgetData('${keyBase}_event_line2', '');
    }
  }

  await HomeWidget.updateWidget(name: 'CalendarWidgetProvider');
}

void logExecutionTime(String label, Stopwatch stopwatch) {
  stopwatch.stop();
  debugPrint('$label took: ${stopwatch.elapsedMilliseconds} ms');
}
