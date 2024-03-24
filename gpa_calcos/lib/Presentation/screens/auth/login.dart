import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/google_button.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

import 'package:gpa_calcos/Presentation/Custom/files/register_button.dart';
import 'package:gpa_calcos/Presentation/Custom/files/text.dart';
import 'package:gpa_calcos/Presentation/Custom/files/textfield.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    MainColors mainColors = MainColors();

    CustomTextStyles text1 = CustomTextStyles();
    // Use dependency injection to calll colors.color
    Color mainColor = const Color(0xff3D7282);
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF949798),
              Color(0xFF5E8D9B),
            ],
            begin: Alignment.topCenter,
            //  end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          body: Center(
            child: Container(
              height: 536.r,
              width: 285.r,
              padding: EdgeInsets.symmetric(horizontal: 31.w),
              margin: EdgeInsets.symmetric(horizontal: 44.w, vertical: 123.h),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 85.h,
                  ),
                  Text(
                    text1.header1Text,
                    style: text1.header1,
                  ),
                  Text(
                    'Sign in with',
                    style: text1.header2,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  MainButton(
                    imagePath: 'assets/google.png',
                    textSize: 18,
                    text: "Google",
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                  Text(
                    'OR',
                    style: text1.header2,
                  ),
                  CustomTextField(text: 'email', controller: emailController),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextField(
                      text: 'password', controller: passwordController),
                  SizedBox(
                    height: 20.h,
                  ),
                  RegisterButton(
                    textSize: 20,
                    text: 'LogIn',
                    color: mainColors.color1,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Don't have an account?  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text('Sign up',
                            style: TextStyle(
                              color: mainColors.color1,
                              fontWeight: FontWeight.normal,
                              fontSize: 13.sp,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
