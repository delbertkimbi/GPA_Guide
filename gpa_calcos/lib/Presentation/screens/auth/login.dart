import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/Toast/showtoast.dart';
import 'package:gpa_calcos/Presentation/Custom/files/google_button.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/text.dart';
import 'package:gpa_calcos/Presentation/Custom/files/textfield.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';
import 'package:gpa_calcos/Presentation/screens/auth/auth_services.dart';
import 'package:gpa_calcos/Presentation/screens/auth/custom/auth_button.dart';
import 'package:gpa_calcos/Presentation/screens/auth/custom/password_textfield.dart';

@RoutePage()
class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _auth = AuthService();
  CustomTextStyles text1 = CustomTextStyles();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffF1EFFA),
              Color(0xffF1EFFA),
              Color(0xff9191F5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Flexible(
                child: Container(
                  height: 500.r,
                  width: 285.r,
                  padding: EdgeInsets.symmetric(horizontal: 31.w),
                  margin:
                      EdgeInsets.symmetric(horizontal: 44.w, vertical: 123.h),
                  decoration: BoxDecoration(
                    color: MainColors.color4,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          height: 90.r,
                          width: 100,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Colors.white,
                          ),
                          // child: Icon(
                          //   Icons.person,
                          //   color: MainColors.color1,
                          //   size: 50.r,
                          // ),
                          child: Image.asset('assets/try.png'),
                        ),
                        SizedBox(
                          height: 10.h,
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
                        GestureDetector(
                          onTap: () async {
                            final user = await _auth.signInWithGoogle();
                            if (user != null) {
                              const CircularProgressIndicator();
                              context.router.replace(const HomePage());
                            }
                          },
                          child: MainButton(
                            imagePath: 'assets/google.png',
                            textSize: 18,
                            text: "Google",
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'OR',
                          style: text1.header2,
                        ),
                        CustomTextField(
                            onChaged: (value) {},
                            text: 'email',
                            controller: emailController),
                        SizedBox(
                          height: 8.h,
                        ),
                        PasswordFormField(
                          labelText: 'password',
                          controller: passwordController,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        LoginButton(
                          text: 'Log In',
                          onPressed: () async => await _handleLogin(context),
                          isLoading: isLoading,
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
                                color: MainColors.color1,
                                fontSize: 13.sp,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                AutoRouter.of(context).push(SignUp());
                              },
                              child: Text('Sign up',
                                  style: TextStyle(
                                    color: MainColors.color2,
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
        ),
      ),
    );
  }

  bool isLoading = false;

  Future<void> _handleLogin(BuildContext context) async {
    setState(() {
      // Set isLoading to true to show the loader
      isLoading = true;
    });

    final user = await _auth.logInWithEmailAndPAssword(
        emailController.text.trim(), passwordController.text.trim());
    setState(() {
      isLoading = false;
    });

    if (user != null) {
      showToast(message: 'Login successful');

      context.router.replace(const HomePage());
    } else {
      showToast(message: 'An error occurred');
    }
  }
}
