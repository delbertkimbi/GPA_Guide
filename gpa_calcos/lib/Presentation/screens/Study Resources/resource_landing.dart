import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

@RoutePage()
class LearningRourcesLanding extends StatelessWidget {
  const LearningRourcesLanding({super.key});

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
                color: MainColors.color2),
          ),
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: MainColors.color2,
              )),
        ),
        body: Center(
          child: Container(
            height: 300.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 25.r),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MainColors.color5,
              //color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.9),
                  blurRadius: 1.0.r,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Coming Soon...',
                  style: TextStyle(
                    color: MainColors.color2,
                    fontWeight: FontWeight.w600,
                    fontSize: 30.sp,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Learning resources, specific to your field of study and more. ',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: MainColors.color1,
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
