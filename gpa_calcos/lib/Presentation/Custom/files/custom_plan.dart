import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

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
        color: Colors.white,
        //color: MainColors.color2,
        borderRadius: BorderRadius.circular(20.r),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.9),
            blurRadius: 1.0.r,
          )
        ],
      ),
      child: ListTile(
          title: Text(
            optiontext,
            style: TextStyle(
              color: MainColors.color1,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: MainColors.color2.withOpacity(.15),
            radius: 20.h,
            child: Icon(
              optionICon,
              color: MainColors.color2,
            ),
          ),
          // leading: Icon(
          //   optionICon,
          //   color: iconColor,
          // ),
          trailing: Icon(
            Icons.arrow_forward,
            size: 24.r,
            color: MainColors.color2,
          )),
    );
  }
}
