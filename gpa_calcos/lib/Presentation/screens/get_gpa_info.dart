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
import 'package:gpa_calcos/Presentation/Routes/headers.dart';

@RoutePage()
class GetSubjectInfo extends StatelessWidget {
  const GetSubjectInfo({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController subjectNameController = TextEditingController();
    TextEditingController gradeController = TextEditingController();
    TextEditingController creditValueNameController = TextEditingController();
    int counter = 0;
    MainColors mainColors = MainColors();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            counter++;
            customShowDialog(context, subjectNameController, gradeController,
                creditValueNameController, mainColors);
          },
          label: const Text("Add Subject")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add your courses for the semester and comcinely get your gpa calculated for you.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: mainColors.color1,
                ),
              ),
              SizedBox(
                height: 20.w,
                child: const Headers(),
              ),

              BlocBuilder<GpaCubit, List<Subject>>(
                builder: (context, subjects) {
                  return ListView.builder(
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      final subject = subjects[index];
                      if (subjects.isEmpty) {
                        return const Center(
                          child: Text("No sunject informationn added yet"),
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 10.h,
                        ),
                        child: Card(
                          child: ListTile(
                            title: Text(subject.name),
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
              // GestureDetector(
              //   onTap: () {
              //     counter++;
              //     customShowDialog(
              //         context,
              //         subjectNameController,
              //         gradeController,
              //         creditValueNameController,
              //         mainColors);
              //   },
              //   child: RegisterButton(
              //     textSize: 25.r,
              //     text: 'Add',
              //     color: mainColors.color1,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              SizedBox(
                height: 10.h,
              ),
              BlocBuilder<GpaCubit, List<Subject>>(
                builder: (context, subjects) {
                  return Visibility(
                    visible: subjects.isNotEmpty,
                    child: GestureDetector(
                      onTap: () {
                        double val =
                            BlocProvider.of<GpaCubit>(context).calculateGPA();
                        AutoRouter.of(context).push(
                          ResultPage(ccv: 44, cwgp: 4, gpa: val),
                        );
                      },
                      child: RegisterButton(
                        textSize: 20.r,
                        text: 'Submit',
                        color: mainColors.color1,
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
      MainColors mainColors) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                      text: 'Subject Name',
                      controller: subjectNameController,
                    ),
                    CustomTextField(text: 'Grade', controller: gradeController),
                    CustomTextField(
                        text: 'Credit Value',
                        controller: creditValueNameController),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        BlocProvider.of<GpaCubit>(context).addSubject(
                            subjectNameController.text.trim(),
                            gradeController.text.trim(),
                            double.parse(
                                creditValueNameController.text.trim()));
                      },
                      child: RegisterButton(
                        textSize: 20.r,
                        text: 'Submit',
                        color: mainColors.color1,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
