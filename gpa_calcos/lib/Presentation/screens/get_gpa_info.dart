import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Bussiness/calculation/gpa_cubit/gpa_cubit.dart';
import 'package:gpa_calcos/Data/models/subjects.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/register_button.dart';
import 'package:gpa_calcos/Presentation/Custom/files/textfield.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';

@RoutePage()
class GetSubjectInfo extends StatefulWidget {
  const GetSubjectInfo({super.key});

  @override
  State<GetSubjectInfo> createState() => _GetSubjectInfoState();
}

class _GetSubjectInfoState extends State<GetSubjectInfo> {
  @override
  Widget build(BuildContext context) {
    TextEditingController subjectNameController = TextEditingController();
    TextEditingController gradeController = TextEditingController();
    TextEditingController creditValueNameController = TextEditingController();
    MainColors mainColors = MainColors();
    return Scaffold(
      backgroundColor: MainColors.color4,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: MainColors.color2,
          onPressed: () {
            customShowDialog(context, subjectNameController, gradeController,
                creditValueNameController, mainColors);
          },
          label: Text(
            "Add Course",
            style: TextStyle(
              color: MainColors.color4,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          )),
      appBar: AppBar(
        backgroundColor: MainColors.color2,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Calculate GPA',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: MainColors.color4),
        ),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: MainColors.color4,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.r),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.w,
              ),
              if (creditValueNameController.text.isEmpty)
                Padding(
                  padding: EdgeInsets.fromLTRB(15.r, 0, 5.r, 0),
                  child: Text(
                    'Add your courses for the semester and get your gpa calculated for you with no stress.',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: MainColors.color1,
                    ),
                  ),
                ),
              SizedBox(
                height: 10.h,
              ),
              BlocBuilder<GpaCubit, List<Subject>>(
                builder: (context, subjects) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      final subject = subjects[index];

                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 2.h,
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        alignment: Alignment.center,
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          onTap: () {
                            final subject =
                                BlocProvider.of<GpaCubit>(context).state[index];
                            // Pre-fill data for editing
                            TextEditingController subjectNameController =
                                TextEditingController(text: subject.name);
                            TextEditingController gradeController =
                                TextEditingController(text: subject.grade);
                            TextEditingController creditValueNameController =
                                TextEditingController(
                                    text: subject.creditValue.toString());

                            customShowDialog(
                              context,
                              subjectNameController,
                              gradeController,
                              creditValueNameController,
                              mainColors,
                            );
                          },
                          hoverColor: MainColors.color2,
                          title: Row(
                            children: [
                              SizedBox(
                                width: 12.h,
                              ),
                              Text(
                                subject.name,
                                style: TextStyle(
                                  color: MainColors.color1,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              SizedBox(
                                width: 12.h,
                              ),
                              Text(
                                subject.grade,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: MainColors.color1,
                                ),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                subjects.remove(subject);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 15.h,
              ),

              BlocBuilder<GpaCubit, List<Subject>>(
                builder: (context, subjects) {
                  return Visibility(
                    visible: subjects.isNotEmpty,
                    child: GestureDetector(
                      onTap: () {
                        // Calculate GPA
                        List<double> gpaValues =
                            BlocProvider.of<GpaCubit>(context).calculateGPA();
                        double gpa = gpaValues[0]; // Access the calculated GPA

                        // Validate GPA range (0 to 4)
                        if (gpa >= 0 && gpa <= 4) {
                          AutoRouter.of(context).push(
                            ResultPage(
                                ccv: gpaValues[2],
                                cwgp: gpaValues[1],
                                gpa: gpa),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 1),
                              content: Text(
                                "Calculated GPA is outside the valid range (0 - 4). Croscheck your inputs",
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
                        }
                      },
                      child: RegisterButton(
                        textSize: 20.r,
                        text: 'Submit',
                        color: MainColors.color1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
              // SizedBox(
              //   height: 70.h,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> customShowDialog(
    BuildContext context,
    TextEditingController subjectNameController,
    TextEditingController gradeController,
    TextEditingController creditValueNameController,
    MainColors mainColors,
  ) {
    bool creditValueError = false;
    bool gradeError = false; //
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: MainColors.color2,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.h,
            ),
            CustomTextField(
              hasError: false,
              onChaged: (value) {},
              text: 'Subject Name',
              controller: subjectNameController,
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                CustomTextField(
                  hasError: gradeError, // Use error flag for visual indication
                  onChaged: (value) {
                    // Implement grade validation logic here
                    // You can use a regular expression or a predefined list of valid grades
                    value = gradeController.text.toUpperCase();
                    if (isValidGrade(value)) {
                      gradeError = false;
                    } else {
                      gradeError = true;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 1),
                          content: Text(
                            "Invalid grade format",
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
                    }
                  },
                  text: 'Grade',
                  controller: gradeController,
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
              hasError:
                  creditValueError, // Use error flag for visual indication
              onChaged: (value) {
                try {
                  double.parse(value);
                  creditValueError = false; // Reset error flag on valid input
                } on FormatException {
                  creditValueError = true;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Text(
                        "Invalid credit value",
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
                }
              },
              text: 'Credit Value',
              controller: creditValueNameController,
            ),
            SizedBox(
              height: 15.h,
            ),
            GestureDetector(
              onTap: () {
                String subjectName = subjectNameController.text.trim();
                String grade = gradeController.text.trim();
                String creditValueString =
                    creditValueNameController.text.trim();
                // Check for empty fields before validation
                if (subjectName.isEmpty ||
                    grade.isEmpty ||
                    creditValueString.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Text(
                        "Please fill in all fields (Subject Name, Grade, Credit Value).",
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
                  return; // Exit the tap handler if any field is empty
                }
                if (!creditValueError && !gradeError) {
                  // Check for both credit value and grade error
                  Navigator.of(context).pop();
                  BlocProvider.of<GpaCubit>(context).addSubject(
                      subjectNameController.text.trim(),
                      gradeController.text.trim().toUpperCase(),
                      double.parse(creditValueNameController.text.trim()));
                  // Clear text fields after successful addition
                  subjectNameController.clear();
                  gradeController.clear();
                  creditValueNameController.clear();
                } else {
                  // Show message if there's an error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Text(
                        creditValueError
                            ? "Invalid credit value"
                            : "Invalid grade format",
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
                }
              },
              child: RegisterButton(
                textSize: 18.r,
                text: 'Add',
                color: creditValueError || gradeError
                    ? Colors.grey
                    : MainColors
                        .color1, // Disable button or change color on error
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }

  List<String> grades = ["A", "B+", "B", "C+", "C", "D+", "D", "F"];

  bool isValidGrade(String grade) {
    grade = grade.toUpperCase();
    return grades.contains(grade) || grades.contains(grade.toLowerCase());
  }
}
