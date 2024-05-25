import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/custom_plan.dart';

@RoutePage()
class PlannerLandingPage extends StatefulWidget {
  const PlannerLandingPage({super.key});

  @override
  State<PlannerLandingPage> createState() => _PlannerLandingPageState();
}

class _PlannerLandingPageState extends State<PlannerLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColors.color2,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Study Plan',
          style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.all(20.r),
          margin: EdgeInsets.all(20.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30.h,
              ),
              const OptionBox(
                optiontext: 'Daily plan',
                optionICon: Icons.leaderboard_sharp,
                iconColor: Colors.yellow,
              ),
              SizedBox(
                height: 20.h,
              ),
              const OptionBox(
                optiontext: 'Weekly plan',
                optionICon: Icons.leaderboard_sharp,
                iconColor: Colors.yellow,
              ),
              SizedBox(
                height: 20.h,
              ),
              const OptionBox(
                optiontext: 'Monthly plan',
                optionICon: Icons.leaderboard_sharp,
                iconColor: Colors.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              const OptionBox(
                optiontext: 'Semester plan',
                optionICon: Icons.leaderboard_sharp,
                iconColor: Colors.red,
              ),
              SizedBox(
                height: 20.h,
              ),
              Image.asset('assets/plan1.png'),
            ],
          ),
        ),
      ),
    );
  }
}
