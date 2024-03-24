// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterButton extends StatelessWidget {
  final String text;
  late Color color;
  FontWeight fontWeight;
  final int textSize;

  RegisterButton({
    super.key,
    required this.textSize,
    required this.text,
    required this.color,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      width: 222.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: textSize.sp,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
