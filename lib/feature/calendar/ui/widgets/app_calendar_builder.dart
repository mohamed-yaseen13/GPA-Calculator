import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/calendar/data/models/event_model.dart';
import 'package:gpa_calculator/table_calendar/lib/table_calendar.dart';

class AppCalendarBuilder {
  static CalendarBuilders build() {
    return CalendarBuilders(
      markerBuilder: (context, date, eventList) {
        if (eventList.isEmpty) return const SizedBox.shrink();
        return Column(
          children: [
            SizedBox(height: 72.h),
            ...eventList
                .take(2)
                .map(
                  (event) => Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Container(
                      decoration: BoxDecoration(
                        color: event.color,
                        borderRadius: BorderRadius.circular(6.sp),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 2.h,
                      ),
                      child: Text(
                        (event as EventModel).title,
                        style: TextStyle(
                          fontSize: eventList.length > 2 ? 9.sp : 12.sp,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
            if (eventList.length > 2)
              Text(
                '+${eventList.length - 2}',
                style: TextStyle(fontSize: 10.sp),
              ),
          ],
        );
      },
    );
  }
}
