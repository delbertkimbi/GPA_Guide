import 'package:flutter/material.dart';

class GetSubjectInfo2 extends StatefulWidget {
  const GetSubjectInfo2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GetSubjectInfoState2 createState() => _GetSubjectInfoState2();
}

class _GetSubjectInfoState2 extends State<GetSubjectInfo2> {
  List<SubjectInfo> subjectInfoList = [];

  TextEditingController subjectNameController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController creditValueController = TextEditingController();

  void _addSubjectInfo() async {
    final result = await showDialog<SubjectInfo>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Subject Information'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: subjectNameController,
              decoration: const InputDecoration(labelText: 'Subject Name'),
            ),
            TextField(
              controller: gradeController,
              decoration: const InputDecoration(labelText: 'Grade'),
            ),
            TextField(
              controller: creditValueController,
              decoration: const InputDecoration(labelText: 'Credit Value'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final subjectName = subjectNameController.text;
              final grade = gradeController.text;
              final creditValue = creditValueController.text;

              if (subjectName.isNotEmpty &&
                  grade.isNotEmpty &&
                  creditValue.isNotEmpty) {
                final newSubjectInfo = SubjectInfo(
                  subjectName: subjectName,
                  grade: grade,
                  creditValue: creditValue,
                );

                setState(() {
                  subjectInfoList.add(newSubjectInfo);
                });

                subjectNameController.clear();
                gradeController.clear();
                creditValueController.clear();

                Navigator.pop(context, newSubjectInfo);
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );

    if (result != null) {
      // SubjectInfo submitted, you can perform any additional actions here if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subject Information'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _addSubjectInfo,
            child: const Text('Add'),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: subjectInfoList.length,
              itemBuilder: (context, index) {
                final subjectInfo = subjectInfoList[index];
                return ListTile(
                  title: Text(subjectInfo.subjectName),
                  subtitle: Text(
                      'Grade: ${subjectInfo.grade}, Credit Value: ${subjectInfo.creditValue}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectInfo {
  final String subjectName;
  final String grade;
  final String creditValue;

  SubjectInfo({
    required this.subjectName,
    required this.grade,
    required this.creditValue,
  });
}



//AIzaSyCEiXZodeFVE6l-43q0tCpXqxBzjPcdp5A


/*
firebase_core: ^1.17.1
firebase_auth: ^3.3.19
firebase_database: ^9.0.15
firebase_messaging: ^11.4.1
firebase_storage: ^10.2.17
event: ^2.0.5
mutex: ^3.0.0
chat_bubbles: ^1.3.0
clipboard: ^0.1.3
image_picker: ^0.8.5+3
shared_preferences: ^2.0.15
path_provider: ^2.0.11
xdg_directories: ^0.2.0
flutter_tts: ^3.4.0
google_speech: ^2.1.1
speech_to_text: ^5.6.0
record: ^4.1.1
gcloud: ^0.8.5
flutter_local_notifications: ^9.6.0
http: ^0.13.4
crypto: ^3.0.2
semaphore: ^0.2.1
audioplayers: ^1.0.0
spring_button: ^2.0.0
google_fonts: ^3.0.1
flutter_app_name: ^0.1.1  
 */