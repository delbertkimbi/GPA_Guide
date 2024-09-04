import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/Toast/showtoast.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/custom_plan.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';
import 'package:gpa_calcos/Presentation/screens/customized.dart';

@RoutePage()
class StudyPlanLandingPage extends StatefulWidget {
  const StudyPlanLandingPage({super.key});

  @override
  State<StudyPlanLandingPage> createState() => _StudyPlanLandingPageState();
}

class _StudyPlanLandingPageState extends State<StudyPlanLandingPage> {
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
      backgroundColor: MainColors.color5,
      appBar: AppBar(
        backgroundColor: MainColors.color2,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Study Plans',
          style: TextStyle(
              fontSize: 20.sp,
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
                  'Get a plan',
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            GestureDetector(
              onTap: () {
                CircularProgressIndicator(
                  color: MainColors.color2,
                );
                FirebaseAuth.instance.authStateChanges().listen((User? user) {
                  if (user != null) {
                    AutoRouter.of(context).push(const PlannerLandingPage());
                  } else {
                    context.router.replace(
                        const LogIn()); // Navigate to LogIn if logged out
                  }
                });
              },
              child: const OptionBox(
                optiontext: 'Manual Plans',
                optionICon: Icons.pending_actions,
                iconColor: Colors.black,
                index: '1',
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                showToast(message: 'Coming soon');
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (BuildContext context) {
                //   return const CustomizedPage(title: 'AI Study Plan');
                // }));
              },
              child: const OptionBox(
                optiontext: 'AI generated Plan',
                optionICon: Icons.android,
                iconColor: Colors.black,
                index: '2',
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Image.asset('assets/bob4.png'),
          ],
        ),
      ),
    );
  }
}
