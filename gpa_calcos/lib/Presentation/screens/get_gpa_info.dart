import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/register_button.dart';
import 'package:gpa_calcos/Presentation/Custom/files/textfield.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';

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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Column(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () {
                    counter++;
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomTextField(
                                    text: 'Subject Name',
                                    controller: subjectNameController,
                                  ),
                                  CustomTextField(
                                      text: 'Grade',
                                      controller: gradeController),
                                  CustomTextField(
                                      text: 'Credit Value',
                                      controller: creditValueNameController),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: RegisterButton(
                                      textSize: 25.r,
                                      text: 'Submit',
                                      color: mainColors.color1,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ));
                  },
                  child: RegisterButton(
                    textSize: 25.r,
                    text: 'Add',
                    color: mainColors.color1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  child: counter > 0
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            AutoRouter.of(context).push(
                              ResultPage(ccv: 44, cwgp: 4, gpa: 4),
                            );
                          },
                          child: RegisterButton(
                            textSize: 25.r,
                            text: 'Submit',
                            color: mainColors.color1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
