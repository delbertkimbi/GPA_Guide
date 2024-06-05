import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

@RoutePage()
class SemesterSchedules extends StatefulWidget {
  const SemesterSchedules({super.key});

  @override
  State<SemesterSchedules> createState() => _SemesterSchedulesState();
}

class _SemesterSchedulesState extends State<SemesterSchedules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColors.color2,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Weekly Schedule',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: SfCalendar(
        view: CalendarView.workWeek,
      ),
    );
  }
}
