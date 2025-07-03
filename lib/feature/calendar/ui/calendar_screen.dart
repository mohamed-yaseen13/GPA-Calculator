import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/widgets/app_drawer.dart';
import 'package:gpa_calculator/feature/calendar/logic/cubit/calendar_cubit.dart';
import 'package:gpa_calculator/feature/calendar/logic/cubit/calendar_state.dart';
import 'package:gpa_calculator/feature/calendar/ui/widgets/app_calendar_builder.dart';
import 'package:gpa_calculator/feature/calendar/ui/widgets/app_calendar_theme.dart';
import 'package:gpa_calculator/table_calendar/lib/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(selectedRoute: DrawerRoute.calendar),
      appBar: AppBar(title: Text('Calendar')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, state) {
            final cubit = context.read<CalendarCubit>();
            return SingleChildScrollView(
              child: TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.saturday,
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2100, 12, 31),
                focusedDay: state.focusedDay,
                rowHeight: 130.h,
                eventLoader: (day) => cubit.eventsForDay(day),
                selectedDayPredicate: (day) => false,
                rangeStartDay: state.rangeStart,
                rangeEndDay: state.rangeEnd,
                onDaySelected: (selectedDay, focusedDay) {
                  cubit.selectDay(selectedDay, focusedDay);
                },
                onRangeSelected: (start, end, focusedDay) async {
                  if (start != null && end != null && isSameDay(start, end)) {
                    cubit.selectDay(start, focusedDay);
                    return;
                  }
                  cubit.setRange(start, end, focusedDay);
                  if (start != null && end != null && !isSameDay(start, end)) {
                    await cubit.addEventForRange(context, start, end);
                  }
                },
                rangeSelectionMode:
                    state.rangeSelectionMode
                        ? RangeSelectionMode.toggledOn
                        : RangeSelectionMode.disabled,
                calendarBuilders: AppCalendarBuilder.build(),
                onDayLongPressed: (day, _) async {
                  await cubit.showEventsForDay(context, day);
                },
                calendarStyle: AppCalendarTheme.calendarStyle(context),
                headerStyle: AppCalendarTheme.headerStyle(context),
              ),
            );
          },
        ),
      ),
    );
  }
}
