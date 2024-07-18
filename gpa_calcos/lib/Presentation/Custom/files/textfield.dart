import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Function(String) onChaged;
  final TextEditingController controller;
  final String? errorMessage; // Stores the error message
  final bool obscureText = false; //

  const CustomTextField({
    super.key,
    required this.text,
    required this.onChaged,
    required this.controller,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h, // Maintain consistent height
      width: 250.h,
      child: TextFormField(
        enabled: true,
        textAlign: TextAlign.center,
        controller: controller,
        onChanged: (value) {
          onChaged(value);
        },
        decoration: InputDecoration(
          errorText: errorMessage,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            // Border when not focused
            borderSide: BorderSide(
                color: MainColors.color1.withOpacity(.3)), // Set border color
          ),
          focusedBorder: OutlineInputBorder(
            // Border when not focused
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: MainColors.color1), // Set border color
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.h),
            borderSide: BorderSide(
              color: MainColors.color4
                  .withOpacity(.2), // Change border color based on error
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
          hintText: text,
          hintStyle: TextStyle(
            color: MainColors.color3,
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
