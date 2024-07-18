import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/custom_plan.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';

@RoutePage()
class PlannerLandingPage extends StatefulWidget {
  const PlannerLandingPage({super.key});

  @override
  State<PlannerLandingPage> createState() => _PlannerLandingPageState();
}

class _PlannerLandingPageState extends State<PlannerLandingPage> {
  void onMenuItemSelected(int item) {
    // Handle menu item selection based on the value
    switch (item) {
      case 1:
        // Navigate to edit screen
        break;
      case 2:
        // Share functionality
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        actions: [
          PopupMenuButton<int>(
            color: Colors.white,
            onSelected: (item) => onMenuItemSelected(item),
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 1,
                child: Text(
                  'Start Plan',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: MainColors.color1,
                  ),
                ),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text(
                  'About',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: MainColors.color1,
                  ),
                ),
              ),
            ],
          ),
        ],
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.all(20.r),
              margin: EdgeInsets.all(20.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () =>
                        AutoRouter.of(context).push(const DailySchedules()),
                    child: const OptionBox(
                      index: '1',
                      optiontext: 'Daily plan',
                      optionICon: Icons.leaderboard_sharp,
                      iconColor: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () =>
                        AutoRouter.of(context).push(const WeeklySchedules()),
                    child: const OptionBox(
                      index: '2',
                      optiontext: 'Weekly plan',
                      optionICon: Icons.leaderboard_sharp,
                      iconColor: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () =>
                        AutoRouter.of(context).push(const MonthlySchedules()),
                    child: const OptionBox(
                      index: '3',
                      optiontext: 'Monthly plan',
                      optionICon: Icons.leaderboard_sharp,
                      iconColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () =>
                        AutoRouter.of(context).push(const SemesterSchedules()),
                    child: const OptionBox(
                      index: '4',
                      optiontext: 'Semester plan',
                      optionICon: Icons.leaderboard_sharp,
                      iconColor: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Image.asset('assets/plan1.png'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
