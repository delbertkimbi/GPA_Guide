import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart' as cv;
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/screens/Study%20planner/screens/add_study_plan.dart';
import '../controllers/calendar_controller.dart';
import '../models/study_plan_event.dart';

class DailyCalendarView extends StatelessWidget {
  const DailyCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daily Study Plans",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
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
      body: cv.DayView(
        showVerticalLine: true,
        showLiveTimeLineInAllDays: true,
        backgroundColor: MainColors.color4,
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
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Topic: ${event.topic}", // Display topic
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
                // Text(
                //   "Start: ${DateFormat.jm().format(event.startTime!)}", // Format start time
                //   style: const TextStyle(fontSize: 12),
                //   overflow: TextOverflow.ellipsis,
                // ),
                // Text(
                //   "End: ${DateFormat.jm().format(event.endTime!)}", // Format end time
                //   style: const TextStyle(fontSize: 12),
                //   overflow: TextOverflow.ellipsis,
                // ),
              ],
            ),
          );
        },
        // onEventTap: (event, dateTime) {
        //   if (event != null) {
        //     showDialog(
        //       context: context,
        //       builder: (BuildContext context) {
        //         return AlertDialog(
        //           title: Text((event as StudyPlanEvent).subject),
        //           content: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               Text("Topic: ${(event as StudyPlanEvent).topic}"),
        //               Text(
        //                   "Start Time: ${DateFormat.jm().format((event as StudyPlanEvent).startTime!)}"),
        //               Text(
        //                   "End Time: ${DateFormat.jm().format((event as StudyPlanEvent).endTime!)}"),
        //               Text("Date: ${DateFormat.yMd().format(dateTime)}"),
        //             ],
        //           ),
        //           actions: [
        //             TextButton(
        //               onPressed: () {
        //                 Navigator.of(context).pop();
        //               },
        //               child: const Text("Close"),
        //             ),
        //           ],
        //         );
        //       },
        //     );
        //   }
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
