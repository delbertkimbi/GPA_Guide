import 'package:auto_route/auto_route.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/Widgets/drawer.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';
import 'package:gpa_calcos/Presentation/screens/chat.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffF1EFFA),
            Color(0xffF1EFFA),
            Color(0xffF1EFFA),
            Color(0xff9191F5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        // color: Colors.white,
      ),
      child: Scaffold(
        key: _scaffoldKey, // Assign GlobalKey
        drawer: const CustomDrawer(
          userName: 'GPA Calcos',
          userEmail: 'Calculations made easy, with AI.',
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ChatAI(),
            ));
          },
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChatAI(),
                ));
              },
              icon: const Icon(Icons.chat)),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 35.r,
            ),
            color: MainColors.color1,
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer(); // Use GlobalKey
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'GPA Calcos',
            style: TextStyle(
              color: MainColors.color1,
              fontWeight: FontWeight.bold,
              fontSize: 30.sp,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 0.h,
              ),
              Container(
                padding: EdgeInsets.all(8.r),
                margin: EdgeInsets.symmetric(horizontal: 20.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customBox(
                          color: Colors.white,
                          icon: Icons.calculate,
                          text: 'GPA  ',
                          page: const GetSubjectInfo(),
                        ),
                        SizedBox(
                          width: 30.h,
                        ),
                        customBox(
                          color: Colors.black,
                          icon: Icons.calculate_rounded,
                          text: 'CGPA',
                          page: const CgpaInfo(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customBox(
                          color: const Color(0xffE15555),
                          icon: Icons.drive_file_rename_outline_rounded,
                          text: 'Study planner',
                          page: const PlannerLandingPage(),
                        ),
                        SizedBox(
                          width: 30.h,
                        ),
                        customBox(
                          color: Colors.yellow,
                          icon: Icons.grade_rounded,
                          text: 'Grading System',
                          page: const GradingSystem(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 390.r,
                width: 400.r,
                child: CarouselSlider(
                  items: [
                    // Define each image item here
                    Image.asset(
                      'assets/bob2.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/bob1.png',
                      fit: BoxFit.cover,
                    ),

                    Image.asset(
                      'assets/bob3.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/bob4.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/bob5.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/bob6.png',
                      fit: BoxFit.cover,
                    ),

                    // Add more image assets as needed
                  ],
                  options: CarouselOptions(
                    height: 390.r,
                    aspectRatio: 16 / 9, // Adjust aspect ratio if needed
                    viewportFraction:
                        1.5, // Adjust visible portion of each slide
                    enableInfiniteScroll: true, // Enable looping through images
                    autoPlay: true, // Set to true for automatic sliding
                    autoPlayInterval: const Duration(seconds: 5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector customBox(
      {required String text,
      required final page,
      required IconData icon,
      required Color color}) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(page);
      },
      child: Container(
        height: 130.h,
        width: 130.h,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: const Color(0xff9191F5),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3.r),
              offset: const Offset(0, 10),
              blurRadius: 10.0.r,
              spreadRadius: 0.0.r,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35.r,
              color: color,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
