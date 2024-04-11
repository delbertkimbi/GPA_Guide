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
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: mainColors.color1,
          onPressed: () {
            customShowDialog(context, subjectNameController, gradeController,
                creditValueNameController, mainColors);
          },
          label: const Text(
            "Add Subject",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.w,
              ),
              Text(
                'Add your courses for the semester and get your gpa calculated for you.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: mainColors.color1,
                ),
              ),
              SizedBox(
                height: 20.w,
              ),
              BlocBuilder<GpaCubit, List<Subject>>(
                builder: (context, subjects) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      final subject = subjects[index];
                      if (subjects.isEmpty) {
                        return Center(
                          child: Text(
                            "No subjects informationn added yet",
                            style: TextStyle(
                              color: mainColors.color1,
                            ),
                          ),
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 2.h,
                        ),
                        child: Card(
                          color: mainColors.color2,
                          child: ListTile(
                            hoverColor: mainColors.color1,
                            title: Text(
                              subject.name,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              subject.grade,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  subjects.remove(subject);
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              BlocBuilder<GpaCubit, List<Subject>>(
                builder: (context, subjects) {
                  return Visibility(
                    visible: subjects.isNotEmpty,
                    child: GestureDetector(
                      onTap: () {
                        List<double> val =
                            BlocProvider.of<GpaCubit>(context).calculateGPA();
                        AutoRouter.of(context).push(
                          ResultPage(ccv: val[2], cwgp: val[1], gpa: val[0]),
                        );
                      },
                      child: RegisterButton(
                        textSize: 20.r,
                        text: 'Submit',
                        color: mainColors.color2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              )
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
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: mainColors.color2,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.h,
            ),
            CustomTextField(
              text: 'Subject Name',
              controller: subjectNameController,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextField(text: 'Grade', controller: gradeController),
            SizedBox(
              height: 10.h,
            ),
            CustomTextField(
                text: 'Credit Value', controller: creditValueNameController),
            SizedBox(
              height: 15.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();

//                 context.router.pop();
                BlocProvider.of<GpaCubit>(context).addSubject(
                    subjectNameController.text.trim(),
                    gradeController.text.trim(),
                    double.parse(creditValueNameController.text.trim()));
                // Clear the text fields after adding the subject
                subjectNameController.clear();
                gradeController.clear();
                creditValueNameController.clear();
              },
              child: RegisterButton(
                textSize: 20.r,
                text: 'Submit',
                color: mainColors.color1,
                fontWeight: FontWeight.w400,
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
}
