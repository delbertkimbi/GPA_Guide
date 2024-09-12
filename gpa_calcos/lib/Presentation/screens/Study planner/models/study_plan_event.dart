import 'package:calendar_view/calendar_view.dart';

// StudyPlanEvent class to handle custom fields for study plans.
class StudyPlanEvent extends CalendarEventData {
  final String subject;
  final String topic; // Add the 'topic' field

  StudyPlanEvent({
    required this.subject,
    required this.topic, // Include the topic in the constructor
    required DateTime startTime,
    required DateTime endTime,
  }) : super(
          title: subject,
          startTime: startTime,
          endTime: endTime,
          date: startTime, // Required by the package
        );
}
