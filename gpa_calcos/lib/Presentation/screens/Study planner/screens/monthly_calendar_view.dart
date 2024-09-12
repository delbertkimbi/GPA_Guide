import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart' as cv;
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/screens/Study%20planner/screens/add_study_plan.dart';
import '../controllers/calendar_controller.dart';
import '../models/study_plan_event.dart';
import 'view_study_plan.dart';

class MonthlyCalendarView extends StatelessWidget {
  const MonthlyCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.color4,
      appBar: AppBar(
        title: const Text(
          "Monthly Study Plans",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
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
      body: cv.MonthView(
        borderColor: MainColors.color5.withOpacity(0.5),
        width: MediaQuery.of(context).size.width,
        showWeekTileBorder: true,
        hideDaysNotInMonth: false,
        // headerBuilder: cv.MonthHeader.hidden,
        // cellBuilder: (date, event, isToday, isInMonth, hideDaysNotInMonth) {
        //   return Container(
        //     padding: const EdgeInsets.all(10),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       color: MainColors.color5,
        //     ),
        //   );
        // },
        // headerBuilder: (date) {
        //   return Container(

        //   );
        // },

        pageTransitionCurve: Curves.easeInCirc,
        headerStyle: cv.HeaderStyle(
            headerTextStyle: TextStyle(
              color: MainColors.color1,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            decoration: BoxDecoration(
              color: MainColors.color2.withOpacity(0.0),
            )),
        controller: CalendarControllerProvider.eventController,
        onEventTap: (event, dateTime) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ViewStudyPlanScreen(event: event as StudyPlanEvent),
            ),
          );
        },
        cellAspectRatio: 1,
        useAvailableVerticalSpace: false,
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
