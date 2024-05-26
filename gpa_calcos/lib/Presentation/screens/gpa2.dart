import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class GpaCalculate extends StatefulWidget {
  const GpaCalculate({super.key});

  @override
  State<GpaCalculate> createState() => _GpaCalculateState();
}

class _GpaCalculateState extends State<GpaCalculate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.color4,
      appBar: AppBar(
        title: Text(
          'Calculate GPA',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: MainColors.color2,
          ),
        ),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: MainColors.color2,
            )),
        actions: [
          Icon(
            Icons.settings,
            color: MainColors.color2,
          ),
          SizedBox(
            width: 15.w,
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 280.h,
            width: 300.w,
            child: Image.asset('assets/wonder.png'),
          ),
          
        ],
      ),
    );
  }
}
