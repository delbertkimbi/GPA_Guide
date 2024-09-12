import 'package:flutter/material.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:intl/intl.dart'; // Import DateFormat for formatting dates
import '../models/study_plan_event.dart';

class ViewStudyPlanScreen extends StatelessWidget {
  final StudyPlanEvent event;

  const ViewStudyPlanScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    // Define date format for consistent display
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final DateFormat timeFormat = DateFormat('HH:mm');

    return Scaffold(
      backgroundColor: MainColors.color4,
      appBar: AppBar(
        title: const Text(
          "Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 23,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: MainColors.color2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16.0).copyWith(left: 20),
              decoration: BoxDecoration(
                color: MainColors.color5,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.subject,
                    style: TextStyle(
                      fontSize: 20,
                      color: MainColors.color1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    event.topic,
                    style: TextStyle(
                      fontSize: 18,
                      color: MainColors.color1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Start Time:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MainColors.color1,
                    ),
                  ),
                  Text(
                    "${dateFormat.format(event.startTime!)} ${timeFormat.format(event.startTime!)}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "End Time:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MainColors.color1,
                    ),
                  ),
                  Text(
                    "${dateFormat.format(event.endTime!)} ${timeFormat.format(event.endTime!)}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(vertical: 16.0),
            //     decoration: BoxDecoration(
            //       color: MainColors.color2,
            //       borderRadius: BorderRadius.circular(12),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.2),
            //           spreadRadius: 2,
            //           blurRadius: 5,
            //           offset: const Offset(0, 3),
            //         ),
            //       ],
            //     ),
            //     child: const Center(
            //       child: Text(
            //         "Back",
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
