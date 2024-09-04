import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

@RoutePage()
class Learningpage extends StatelessWidget {
  const Learningpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.color5,
      appBar:AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: MainColors.color4,
            )),
        centerTitle: true,
        backgroundColor: MainColors.color2,
        elevation: 0,
        title: Text(
          "Study Resources",
          style: TextStyle(
              color: MainColors.color4,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: 300.h,
          width: double.infinity,
          padding: EdgeInsets.all(20.r),
          margin: EdgeInsets.symmetric(
            horizontal: 25.r,
            vertical: 20.h,
          ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.search),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Go'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Coming Soon...',
                style: TextStyle(
                  color: MainColors.color2,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
              ),
              // SizedBox(
              //   height: 5.h,
              // ),
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
    );
  }
}
