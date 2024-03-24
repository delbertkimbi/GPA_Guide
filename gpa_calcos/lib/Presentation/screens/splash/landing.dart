import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    Color blueblack = const Color(0xFF010048);
    return SafeArea(
        child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF949798),
            Color(0xFF5E8D9B),
          ],
          begin: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(70.h, 0, 0, 0),
                        width: 500.w,
                        height: 627.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/land.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 400.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Welcome to \n',
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 10.0.sp,
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'GPA Calcos',
                                style: TextStyle(
                                  color: blueblack,
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 24.r),
                          child: Center(
                            child: Text(
                              'We help you calculate your \nGPA with no stress',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    ));
  }
}
