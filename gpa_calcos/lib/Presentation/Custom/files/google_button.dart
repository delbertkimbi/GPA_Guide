// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  late Color color;
  FontWeight fontWeight;
  final int textSize;
  String? imagePath;
  MainButton({
    super.key,
    required this.textSize,
    required this.text,
    required this.color,
    this.imagePath,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: 225.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: MainColors.color1,
                fontSize: textSize.sp,
                fontWeight: fontWeight,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Image.asset(imagePath!, width: 23.r, height: 23.r)
          ],
        ),
      ),
    );
  }
}
