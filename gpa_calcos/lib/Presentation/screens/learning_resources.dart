import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
@RoutePage()
class Learningpage extends StatelessWidget {
  const Learningpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Learning Resources',
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
              fontSize: 30.sp,
            ),
          ),
        ),
      ),
    );
  }
}
