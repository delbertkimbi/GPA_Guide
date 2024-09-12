import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart' as cv;
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/screens/Study%20planner/screens/add_study_plan.dart';
import '../controllers/calendar_controller.dart';
import '../models/study_plan_event.dart';
import 'view_study_plan.dart';

class WeeklyCalendarView extends StatelessWidget {
  const WeeklyCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weekly Study Plans",
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
      body: cv.WeekView(
        backgroundColor: MainColors.color4,
        weekPageHeaderBuilder: cv.WeekHeader.hidden,
        controller: CalendarControllerProvider.eventController,
        eventTileBuilder: (date, events, boundary, start, end) {
          final event = events.first as StudyPlanEvent;
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: MainColors.color2.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.subject,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Topic: ${event.topic}", // Display topic
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Start: ${event.startTime}",
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "End: ${event.endTime}",
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
        emulateVerticalOffsetBy: 0,
        // onEventTap: (event, dateTime) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) =>
        //           ViewStudyPlanScreen(event: event as StudyPlanEvent),
        //     ),
        //   );
        // },
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
