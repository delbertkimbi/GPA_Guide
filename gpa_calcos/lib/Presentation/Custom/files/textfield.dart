import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Function(String) onChaged;
  final TextEditingController controller;
  final bool hasError;

  const CustomTextField({
    super.key,
    required this.text,
    required this.onChaged,
    required this.controller,
    required this.hasError,
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
          onChanged: (value) {
            onChaged(value);
          },
          decoration: InputDecoration(
            errorText: hasError ? "Invalid Input" : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.h),
              borderSide: BorderSide(
                color: hasError
                    ? Colors.red
                    : MainColors.color1, // Change border color based on error
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
