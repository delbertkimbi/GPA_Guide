import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      actions: [
        SizedBox(
          height: 270.h,
          width: 300.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Text(
                'About Page',
                style: TextStyle(
                  color: MainColors.color1,
                  fontWeight: FontWeight.w500,
                  fontSize: 23.sp,
                ),
              ),
              SizedBox(
                height: 20.r,
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.h,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
            ],
          ),
        )
      ],
    );
  }
}
