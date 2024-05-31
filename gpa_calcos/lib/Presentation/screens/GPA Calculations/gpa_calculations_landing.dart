import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/custom_plan.dart';

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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: const OptionBox(
              optiontext: 'GPA Calculation',
              optionICon: Icons.group,
              iconColor: Colors.yellow,
              index: '1',
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            child: const OptionBox(
              optiontext: 'CGPA Calculation',
              optionICon: Icons.group,
              iconColor: Colors.yellow,
              index: '2',
            ),
          ),
          Image.asset('assets/gpa.png'),
        ],
      ),
    );
  }
}
