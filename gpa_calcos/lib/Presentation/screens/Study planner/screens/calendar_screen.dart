import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart' as cv;
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import '../controllers/calendar_controller.dart';
import 'daily_calendar_view.dart';
import 'weekly_calendar_view.dart';
import 'monthly_calendar_view.dart';
import 'add_study_plan.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manual Plans',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: MainColors.color2,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: cv.CalendarControllerProvider(
        controller: CalendarControllerProvider.eventController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DailyCalendarView(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: MainColors.color2.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Daily  Schedule",
                          style: TextStyle(
                            fontSize: 18,
                            color: MainColors.color1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WeeklyCalendarView(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: MainColors.color2.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Weekly Schedule",
                          style: TextStyle(
                            fontSize: 18,
                            color: MainColors.color1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MonthlyCalendarView(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: MainColors.color2.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Monthly  Schedule",
                          style: TextStyle(
                            fontSize: 18,
                            color: MainColors.color1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/bob1.png',
                    height: 300.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddStudyPlanScreen(),
            ),
          );
        },
        backgroundColor: MainColors.color2,
        child: Icon(
          Icons.add,
          color: MainColors.color5,
          size: 30,
        ),
      ),
    );
  }
}
