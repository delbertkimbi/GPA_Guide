// import 'package:flutter/material.dart';
// import '../models/study_plan_event.dart';
// import '../controllers/calendar_controller.dart';

// class EditStudyPlanScreen extends StatefulWidget {
//   final StudyPlanEvent event;

//   EditStudyPlanScreen({required this.event});

//   @override
//   _EditStudyPlanScreenState createState() => _EditStudyPlanScreenState();
// }

// class _EditStudyPlanScreenState extends State<EditStudyPlanScreen> {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController _subjectController;
//   late DateTime _startTime;
//   late DateTime _endTime;

//   @override
//   void initState() {
//     super.initState();
//     _subjectController = TextEditingController(text: widget.event.subject);
//     _startTime = widget.event.startTime!;
//     _endTime = widget.event.endTime!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Edit Study Plan")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _subjectController,
//                 decoration: InputDecoration(labelText: "Subject"),
//                 validator: (value) => value!.isEmpty ? "Enter a subject" : null,
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () async {
//                   DateTime? pickedStartTime = await showDatePicker(
//                     context: context,
//                     initialDate: _startTime,
//                     firstDate: DateTime(2023),
//                     lastDate: DateTime(2025),
//                   );
//                   if (pickedStartTime != null) {
//                     setState(() {
//                       _startTime = pickedStartTime;
//                     });
//                   }
//                 },
//                 child: Text("Pick Start Time"),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () async {
//                   DateTime? pickedEndTime = await showDatePicker(
//                     context: context,
//                     initialDate: _endTime,
//                     firstDate: DateTime(2023),
//                     lastDate: DateTime(2025),
//                   );
//                   if (pickedEndTime != null) {
//                     setState(() {
//                       _endTime = pickedEndTime;
//                     });
//                   }
//                 },
//                 child: Text("Pick End Time"),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate() &&
//                       _startTime != null &&
//                       _endTime != null) {
//                     setState(() {
//                       widget.event.subject = _subjectController.text;
//                       widget.event.startTime = _startTime;
//                       widget.event.endTime = _endTime;
//                     });

//                     CalendarControllerProvider.eventController.remove(widget.event);
//                     CalendarControllerProvider.eventController.add(widget.event);

//                     Navigator.pop(context);
//                   }
//                 },
//                 child: Text("Save Changes"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
