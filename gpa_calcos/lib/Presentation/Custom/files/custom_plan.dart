import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionBox extends StatelessWidget {
  final String optiontext;
  final IconData optionICon;
  final Color iconColor;
  final String index;
  const OptionBox({
    super.key,
    required this.optiontext,
    required this.optionICon,
    required this.iconColor,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: 300.w,
      alignment: Alignment.centerLeft,
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
      child: ListTile(
          title: Text(
            optiontext,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: CircleAvatar(
            child: Text(index),
          ),
          trailing: Icon(
            optionICon,
            color: iconColor,
          )),
    );
  }
}
