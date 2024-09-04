import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/custom_plan.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';

@RoutePage()
class GpaCalculationsLanding extends StatefulWidget {
  const GpaCalculationsLanding({super.key});

  @override
  State<GpaCalculationsLanding> createState() => _GpaCalculationsLandingState();
}

class _GpaCalculationsLandingState extends State<GpaCalculationsLanding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
          "Calculations",
          style: TextStyle(
              color: MainColors.color4,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp),
        ),
        actions: [
          IconButton(
            onPressed: () => AutoRouter.of(context).push(const GradingSystem()),
            icon: Icon(
              Icons.settings,
              color: MainColors.color4,
            ),
          ),
          SizedBox(
            width: 5.w,
          )
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            GestureDetector(
              onTap: () => AutoRouter.of(context).push(const GetSubjectInfo()),
              child: const OptionBox(
                optiontext: 'GPA Calculation',
                optionICon: Icons.calculate_outlined,
                iconColor: Colors.yellow,
                index: '1',
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () => AutoRouter.of(context).push(const CgpaInfo()),
              child: const OptionBox(
                optiontext: 'CGPA Calculation',
                optionICon: Icons.calculate,
                iconColor: Colors.yellow,
                index: '2',
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Image.asset('assets/bob5.png'),
          ],
        ),
      ),
    );
  }
}
