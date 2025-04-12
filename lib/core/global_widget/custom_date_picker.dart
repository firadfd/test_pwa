import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import 'controller/custom_date_time_controller.dart';
import 'custom_elevated_button.dart';

class CustomDatePicker extends StatelessWidget {
  final Function(DateTime selectedDate) selectedDateCallback;

  CustomDatePicker({required this.selectedDateCallback});

  @override
  Widget build(BuildContext context) {
    final dateController = Get.find<CustomDateTimeController>();
    var selectedDate = dateController.selectedDate.value;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TableCalendar widget
            Obx(() {
              return TableCalendar(
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextStyle: Theme.of(context).textTheme.titleLarge!,
                ),
                calendarStyle: CalendarStyle(
                  defaultTextStyle: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.black),
                  weekendTextStyle: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.black),
                ),
                focusedDay: dateController.selectedDate.value,
                selectedDayPredicate: (day) {
                  // Return true if the day is the selected date
                  return isSameDay(dateController.selectedDate.value, day);
                },
                daysOfWeekVisible: false,
                onDaySelected: (selectedDay, focusedDay) {
                  selectedDate = dateController.selectedDate.value;
                  dateController.setSelectedDate(selectedDay);
                  selectedDateCallback(
                    selectedDay,
                  ); // Pass the selected date back
                  // Navigator.pop(
                  //     context); // Close the bottom sheet after selecting the date
                },
                firstDay: dateController.startDate.value,
                // Use startDate as the first day
                lastDay: DateTime.utc(2099, 12, 31),
                // Set last valid date
                calendarFormat: CalendarFormat.month,
              );
            }),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomElevatedButton(
                borderRadius: 8.r,
                ontap: () {
                  selectedDateCallback(selectedDate);
                  Navigator.pop(context);
                },
                text: "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
