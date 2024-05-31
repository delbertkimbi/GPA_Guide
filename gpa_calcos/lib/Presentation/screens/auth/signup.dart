import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Bussiness/user_cubit/user_cubit.dart';
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
class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final UserCubit _userCubit = UserCubit();
  final _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    CustomTextStyles text1 = CustomTextStyles();

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
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
                  child: Container(
                    height: 575.r,
                    width: 285.r,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 44.w,
                    ),
                    decoration: BoxDecoration(
                      color: MainColors.color4,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 90.r,
                          padding: EdgeInsets.symmetric(
                            horizontal: 30.w,
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.person,
                            color: MainColors.color1,
                            size: 50.r,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
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
                              context.router.replace(const HomePage());
                            }
                          },
                          child: MainButton(
                            imagePath: 'assets/google.png',
                            textSize: 18,
                            text: "  Google",
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'OR',
                          style: text1.header2,
                        ),
                        CustomTextField(
                          onChaged: (value) => _userCubit.updateUserName(value),
                          text: 'user name',
                          controller: userNameController,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextField(
                          onChaged: (value) =>
                              _userCubit.updateUserEmail(value),
                          text: 'email',
                          controller: emailController,
                        ),
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
                          text: 'Sign Up',
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
                              "Have an account?  ",
                              style: TextStyle(
                                color: MainColors.color1,
                                fontSize: 13.sp,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                AutoRouter.of(context).push(LogIn());
                              },
                              child: Text('Sign In',
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
        );
      },
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    setState(() {
      isLoading = true; // Set to true initially
    });

    final user = await _auth.createUserWithEmailAndPAssword(
        emailController.text.trim(), passwordController.text.trim());
    setState(() {
      isLoading = false;
    });
    if (user != null) {
      showToast(message: 'Account successfully created');
      context.router.replace(const HomePage());
    }
  }
}
