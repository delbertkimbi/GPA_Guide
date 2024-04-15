import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gpa_calcos/Presentation/Custom/files/register_button.dart';
import 'package:gpa_calcos/Presentation/Custom/files/textfield.dart';
import 'package:gpa_calcos/Presentation/screens/cgpa_results.dart';
import 'package:gpa_calcos/Presentation/screens/home.dart';

// Assuming ResultPage exists
@RoutePage()
class CgpaInfo extends StatefulWidget {
  const CgpaInfo({super.key});

  @override
  State<CgpaInfo> createState() => _CgpaInfoState();
}

class _CgpaInfoState extends State<CgpaInfo> {
  final subjectNumberController =
      TextEditingController(text: "0"); // Set initial value

  @override
  void dispose() {
    subjectNumberController.dispose();
    super.dispose();
  }

  int numberOfSemesters = 0;

  /// Check and make sure the input number of subjects is valid
  int tryParseInt(String value) {
    try {
      return int.parse(value);
    } catch (e) {
      // Handle exception (e.g., show an error message)
      debugPrint("Invalid number entered: $e");
      return 0; // Return a default value if parsing fails
    }
  }

  final List<TextEditingController> _gpaControllers =
      []; // List to store controllers

// In the initState method

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Enter the number of subjects you registered",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      label: const Text(
                        "number of Semesters",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  controller: subjectNumberController,
                  keyboardType: TextInputType.number,

                  ///Ensure user input is an int
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ], // Allow only digits
                  onChanged: (value) {
                    // Update the number of subjects when the value changes
                    setState(() {
                      numberOfSemesters = tryParseInt(value);
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(16.0.h),
                  child: Text(
                    "Fill in the spaces with the correct GPAs",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                generateTextFields(size: numberOfSemesters),
                SizedBox(
                  height: 7.h,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CgpaReultsPage(
                            cgpa: _calCulateCgpa(),
                          ),
                        ),
                      );
                    },
                    child: RegisterButton(
                      textSize: 20,
                      text: 'Submit',
                      color: mainColors.color1,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget generateTextFields({required int size}) {
    for (int i = 0; i < numberOfSemesters; i++) {
      _gpaControllers.add(TextEditingController());
    }
    return ListView.builder(
      itemCount: size,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(children: [
          CustomTextField(
            text: ' Gpa for Semester ${index + 1}',
            controller: _gpaControllers[index],
          ),
          SizedBox(
            height: 7.h,
          ),
        ]);
      },
    );
  }

  double _calCulateCgpa() {
    double cgpa = 0;
    for (int i = 0; i < numberOfSemesters; i++) {
      double gpa = double.parse(_gpaControllers[i].text);
      cgpa += gpa;
    }
    cgpa /= numberOfSemesters;
    return cgpa;
  }
}
