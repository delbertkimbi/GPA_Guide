import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

import 'package:gpa_calcos/Presentation/Custom/files/register_button.dart';
import 'package:gpa_calcos/Presentation/Custom/files/textfield.dart';
import 'package:gpa_calcos/Presentation/screens/cgpa_results.dart';

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
  bool _hasEmptyFields = false;

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
    return Scaffold(
      backgroundColor: MainColors.color4,
      appBar: AppBar(
        backgroundColor: MainColors.color2,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: MainColors.color4,
            size: 25.h,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Calculate CGPA',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: MainColors.color4,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Enter the number of simesters attented so far, and corresponding GPAs for each sysmester to get your Cumulative grade point average(CGPA) calculated for you.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                  color: MainColors.color1,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Number of Semesters",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: MainColors.color1),
              ),
              Container(
                height: 50.h,
                width: 300.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.h)),
                margin: EdgeInsets.fromLTRB(0.w, 0, 20.w, 3.h),
                padding: EdgeInsets.fromLTRB(40.h, 10.h, 40.h, 10.h),
                child: TextField(
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: MainColors.color1,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '8',
                    hintStyle: TextStyle(
                      fontSize: 15.sp,
                      color: MainColors.color3,
                    ),
                  ),
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
              ),
              SizedBox(
                height: 5.h,
              ),
              numberOfSemesters > 0
                  ? Text(
                      "Fill in the correct GPAs.",
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: MainColors.color1),
                    )
                  : const Text(""),
              SizedBox(
                height: 10.h,
              ),
              Builder(builder: (context) {
                for (int i = 0; i < numberOfSemesters; i++) {
                  _gpaControllers.add(TextEditingController());
                }
                return ListView.builder(
                  itemCount: numberOfSemesters,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    bool tryOUt = false;
                    return Column(children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0.w, 0, 20.w, 3.h),
                        padding: EdgeInsets.fromLTRB(20.h, 10.h, 10.h, 10.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.h)),
                        child: Row(
                          children: [
                            Text(
                              'Semester ${index + 1}',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: MainColors.color3,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              height: 35.h,
                              width: 100.w,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: MainColors.color3,
                                ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: '0.00',
                                  hintStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: MainColors.color3,
                                  ),
                                ),
                                controller: _gpaControllers[index],
                                onChanged: (value) {
                                  onChaged:
                                  (value) {
                                    double gpa;
                                    int i = 0;
                                    setState(() {
                                      _hasEmptyFields =
                                          false; // Reset error state on valid input
                                    });
                                    try {
                                      gpa = double.parse(value);
                                      tryOUt = gpa < 0.0 || gpa > 4.0;
                                      if (gpa < 0.0 || gpa > 4.0) {
                                        // Show error message (e.g., using SnackBar)
                                        setState(() {
                                          _hasEmptyFields = true;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              duration:
                                                  const Duration(seconds: 1),
                                              content: Text(
                                                "GPA must be between 0.0 and 4.0",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
                                      }
                                    } on FormatException {
                                      setState(() {
                                        _hasEmptyFields = true;
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            duration:
                                                const Duration(seconds: 1),
                                            content: Text(
                                              "Invalid GPA input for semester ${i + 2}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            backgroundColor: Colors.pink,
                                          ),
                                        );
                                      });
                                    }
                                  };
                                },
                              ),
                            ),
                            // CustomTextField(
                            //   text: '0.00',
                            //   controller: _gpaControllers[index],
                            //   hasError: tryOUt,
                            //   onChaged: (value) {
                            //     double gpa;
                            //     int i = 0;
                            //     setState(() {
                            //       _hasEmptyFields =
                            //           false; // Reset error state on valid input
                            //     });
                            //     try {
                            //       gpa = double.parse(value);
                            //       tryOUt = gpa < 0.0 || gpa > 4.0;
                            //       if (gpa < 0.0 || gpa > 4.0) {
                            //         // Show error message (e.g., using SnackBar)
                            //         setState(() {
                            //           _hasEmptyFields = true;
                            //           ScaffoldMessenger.of(context)
                            //               .showSnackBar(
                            //             SnackBar(
                            //               duration: const Duration(seconds: 1),
                            //               content: Text(
                            //                 "GPA must be between 0.0 and 4.0",
                            //                 textAlign: TextAlign.center,
                            //                 style: TextStyle(
                            //                   fontSize: 15.sp,
                            //                   color: Colors.white,
                            //                   fontWeight: FontWeight.normal,
                            //                 ),
                            //               ),
                            //               backgroundColor: Colors.red,
                            //             ),
                            //           );
                            //         });
                            //       }
                            //     } on FormatException {
                            //       setState(() {
                            //         _hasEmptyFields = true;
                            //         ScaffoldMessenger.of(context).showSnackBar(
                            //           SnackBar(
                            //             duration: const Duration(seconds: 1),
                            //             content: Text(
                            //               "Invalid GPA input for semester ${i + 2}",
                            //               textAlign: TextAlign.center,
                            //               style: TextStyle(
                            //                 fontSize: 15.sp,
                            //                 color: Colors.white,
                            //                 fontWeight: FontWeight.normal,
                            //               ),
                            //             ),
                            //             backgroundColor: Colors.pink,
                            //           ),
                            //         );
                            //       });
                            //     }
                            //   },
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                    ]);
                  },
                );
              }),
              SizedBox(
                height: 10.h,
              ),
              if (numberOfSemesters > 0)
                GestureDetector(
                  onTap: () {
                    if (!_hasEmptyFields && _calCulateCgpa().isFinite) {
                      // All fields filled and valid GPA, navigate
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CgpaReultsPage(
                            cgpa: _calCulateCgpa(),
                          ),
                        ),
                      );
                    } else if (_hasEmptyFields) {
                      // Show message for empty fields
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 1),
                          content: Text(
                            "Please fill in all GPA fields. With Correct GPAs",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          backgroundColor: Colors.orange,
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: RegisterButton(
                      textSize: 20,
                      text: 'Calculate',
                      color: MainColors.color2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
            ],
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
            hasError: false,
            onChaged: (value) {
              (value) {
                double gpa;
                int i = 0;
                try {
                  gpa = double.parse(value);
                  if (gpa < 0.0 || gpa > 4.0) {
                    // Show error message (e.g., using SnackBar)
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 1),
                          content: Text(
                            "GPA must be between 0.0 and 4.0",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    });
                  }
                } on FormatException catch (e) {
                  // Handle invalid input (e.g., not a number)
                  debugPrint("Invalid GPA input for semester ${i + 1}: $e");
                }
              };
            },
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
