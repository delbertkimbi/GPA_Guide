import 'package:flutter/material.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:intl/intl.dart'; // Import DateFormat
import '../models/study_plan_event.dart';
import '../controllers/calendar_controller.dart';

class AddStudyPlanScreen extends StatefulWidget {
  const AddStudyPlanScreen({super.key});

  @override
  _AddStudyPlanScreenState createState() => _AddStudyPlanScreenState();
}

class _AddStudyPlanScreenState extends State<AddStudyPlanScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _topicController = TextEditingController();
  DateTime? _selectedDay;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  // Helper function for selecting time
  Future<void> _selectTime(
    BuildContext context,
    TimeOfDay? initialTime,
    Function(TimeOfDay) onTimeSelected,
  ) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null) {
      onTimeSelected(pickedTime);
    }
  }

  // Helper function for selecting day
  Future<void> _selectDay(BuildContext context) async {
    DateTime? pickedDay = await showDatePicker(
      context: context,
      initialDate: _selectedDay ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );
    if (pickedDay != null) {
      setState(() {
        _selectedDay = pickedDay;
      });
    }
  }

  // Helper function for building input fields
  Widget _buildInputField({
    required String label,
    required String displayText,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              displayText,
              style: TextStyle(
                fontSize: 16,
                color: MainColors.color1,
              ),
            ),
            Icon(icon, color: MainColors.color1),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Study Plan",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: MainColors.color2,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Subject input field
                TextFormField(
                  controller: _subjectController,
                  decoration: InputDecoration(
                    labelText: "Subject",
                    labelStyle: TextStyle(color: MainColors.color1),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Enter a subject" : null,
                ),
                const SizedBox(height: 16),

                // Topic input field
                TextFormField(
                  controller: _topicController,
                  decoration: InputDecoration(
                    labelText: "Topic to Study",
                    labelStyle: TextStyle(color: MainColors.color1),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                  validator: (value) => value!.isEmpty ? "Enter a topic" : null,
                ),
                const SizedBox(height: 16),

                // Start Time input
                _buildInputField(
                  label: "Start Time",
                  displayText: _startTime != null
                      ? _startTime!.format(context)
                      : 'Pick Start Time',
                  icon: Icons.access_time,
                  onTap: () {
                    _selectTime(context, _startTime, (pickedTime) {
                      setState(() {
                        _startTime = pickedTime;
                      });
                    });
                  },
                ),
                const SizedBox(height: 16),

                // End Time input
                _buildInputField(
                  label: "End Time",
                  displayText: _endTime != null
                      ? _endTime!.format(context)
                      : 'Pick End Time',
                  icon: Icons.access_time,
                  onTap: () {
                    _selectTime(context, _endTime, (pickedTime) {
                      setState(() {
                        _endTime = pickedTime;
                      });
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Day selection
                _buildInputField(
                  label: "Day",
                  displayText: _selectedDay != null
                      ? DateFormat('yyyy-MM-dd').format(_selectedDay!)
                      : 'Pick a Day',
                  icon: Icons.calendar_today,
                  onTap: () {
                    _selectDay(context);
                  },
                ),
                const SizedBox(height: 16),

                // Add Study Plan Button
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate() &&
                        _startTime != null &&
                        _endTime != null &&
                        _selectedDay != null) {
                      final newEvent = StudyPlanEvent(
                        subject: _subjectController.text,
                        startTime: DateTime(
                          _selectedDay!.year,
                          _selectedDay!.month,
                          _selectedDay!.day,
                          _startTime!.hour,
                          _startTime!.minute,
                        ),
                        endTime: DateTime(
                          _selectedDay!.year,
                          _selectedDay!.month,
                          _selectedDay!.day,
                          _endTime!.hour,
                          _endTime!.minute,
                        ),
                        topic: _topicController.text, // New topic field
                      );

                      CalendarControllerProvider.eventController.add(newEvent);

                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    decoration: BoxDecoration(
                      color: MainColors.color2,
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
                    child: const Center(
                      child: Text(
                        "Add Study Plan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
