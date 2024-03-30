import 'package:flutter/material.dart';

class GetSubjectInfo2 extends StatefulWidget {
  const GetSubjectInfo2({Key? key}) : super(key: key);

  @override
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
        title: Text('Enter Subject Information'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: subjectNameController,
              decoration: InputDecoration(labelText: 'Subject Name'),
            ),
            TextField(
              controller: gradeController,
              decoration: InputDecoration(labelText: 'Grade'),
            ),
            TextField(
              controller: creditValueController,
              decoration: InputDecoration(labelText: 'Credit Value'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
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
            child: Text('Submit'),
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
        title: Text('Subject Information'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _addSubjectInfo,
            child: Text('Add'),
          ),
          SizedBox(height: 10),
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
