import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionBox extends StatelessWidget {
  final String optiontext;
  final IconData optionICon;
  final Color iconColor;
  const OptionBox({
    super.key,
    required this.optiontext,
    required this.optionICon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: 300.w,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: const Color(0xff9191F5),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3.r),
            offset: const Offset(0, 10),
            blurRadius: 10.0.r,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            optiontext,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 60.w,
          ),
          Icon(
            optionICon,
            color: iconColor,
          )
        ],
      ),
    );
  }
}
