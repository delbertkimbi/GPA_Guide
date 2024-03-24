import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/gradient.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    MainGradient gradient = MainGradient();
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
              padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 121.h),
              margin: EdgeInsets.symmetric(horizontal: 44.w, vertical: 123.h),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
