import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class InitialChatScreen extends StatelessWidget {
  const InitialChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/wonder.png"), // Replace with your image path
          SizedBox(height: 10.0.h),
          Text(
            "Welcome to Guide AI. Ask me anything \nor send a picture to get started.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0.sp,
              fontWeight: FontWeight.w500,
              color: MainColors.color1,
            ),
          ),
        ],
      ),
    );
  }
}
