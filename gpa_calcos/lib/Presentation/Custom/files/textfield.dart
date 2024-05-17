import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 38.h,
        width: 222.h,
        child: TextFormField(
          enabled: true,
          textAlign: TextAlign.center,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.h),
              borderSide: BorderSide(
                color: MainColors.color1,
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.h),
            hintText: text,
            hintStyle: TextStyle(
              color: MainColors.color3,
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
