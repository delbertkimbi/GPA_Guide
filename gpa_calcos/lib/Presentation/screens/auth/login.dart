import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/google_button.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

import 'package:gpa_calcos/Presentation/Custom/files/register_button.dart';
import 'package:gpa_calcos/Presentation/Custom/files/text.dart';
import 'package:gpa_calcos/Presentation/Custom/files/textfield.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';

@RoutePage()
class LogIn extends StatelessWidget {
  LogIn({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CustomTextStyles text1 = CustomTextStyles();
    // Use dependency injection to calll colors.color
    Color mainColor = const Color(0xff3D7282);
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF949798),
              Color(0xFF5E8D9B),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                height: 536.r,
                width: 285.r,
                padding: EdgeInsets.symmetric(horizontal: 31.w),
                margin: EdgeInsets.symmetric(horizontal: 44.w, vertical: 123.h),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
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
                      text: "  Google",
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
                    GestureDetector(
                      onTap: () {
                        context.router.replace(const HomePage());
                      },
                      child: RegisterButton(
                        textSize: 20.sp,
                        text: 'Log In',
                        color: MainColors.color1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?  ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            AutoRouter.of(context).push(const SignUp());
                          },
                          child: Text('Sign up',
                              style: TextStyle(
                                color: MainColors.color1,
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
      ),
    );
  }
}
