import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class CustomizedPage extends StatelessWidget {
  const CustomizedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Customized GS',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: MainColors.color1),
          ),
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: MainColors.color1,
              )),
        ),
        body: Center(
          child: Text(
            'Coming Soon...',
            style: TextStyle(
              color: MainColors.color1,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}
