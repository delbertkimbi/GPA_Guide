import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/slider.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final List<String> appDescriptionList = [
    'Effortless GPA and CGPA calculation: Calculate GPA, CGPA, and grades quickly.', // (2 seconds)
    'Beyond Calculations: Learning tools to master coursework.', // (3 seconds)
    'AI Chatbot: Get support and guidance within the app.', // (3 seconds)
    'Stay Organized: Track courses, assignments, and deadlines.', // (3 seconds)
  ];
  final List<String> appDescriptionList2 = [
    'GPA Guide empowers students to excel academically by providing a comprehensive suite of tools for managing and improving their grades.',
    'Supports various grading scales: Customize grading system to suit your own school',
    'Calculate with ease: Calculate your GPA, CGPA, and individual course grades quickly and accurately. Our intuitive interface makes data entry and viewing results a breeze.',
    'Go beyond calculations: GPA Calcos is more than just a calculator. We offer a range of learning tools to help you solidify concepts and master your coursework.',
    'AI Chatbot - Your personalized study buddy: Get instant support and guidance from our innovative AI chatbot. Ask questions, receive study tips, and clarify doubts – all within the app.',
    'Stay organized: Keep track of your courses, assignments, and deadlines with our built-in planner. Never miss an important due date again!',
  ];
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    // Start automatic sliding after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      Timer.periodic(const Duration(seconds: 1), (_) => _nextSlide());
    });
  }

  final List<String> featuresList = [
    'Effortless GPA and CGPA calculation',
    'Supports various grading scales',
    'Calculate GPA for multiple semesters or terms',
    'User-friendly interface for easy data entry',
    'Detailed grade reports and visualizations',
    'Comprehensive learning tools to enhance understanding',
    'AI-powered chatbot for personalized study guidance',
    'Integrated planner for effective time management',
    'Track progress and analyze performance',
    'Set goals and stay motivated',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColors.color2,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'About GPA Guide',
          style: TextStyle(
              fontSize: 20.sp,
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            // App Description
            StringSlider(strings: appDescriptionList2),
            SizedBox(
              height: 30.h,
            ),
            descriptContianer(appDescriptionList[0]),
            SizedBox(
              height: 20.h,
            ),
            descriptContianer(appDescriptionList[1]),

            SizedBox(
              height: 20.h,
            ),
            descriptContianer(appDescriptionList[2]),

            SizedBox(
              height: 20.h,
            ),
            descriptContianer(appDescriptionList[3]),

            SizedBox(
              height: 20.h,
            ),

            // Features List

            // Credits (Optional)
          ],
        ),
      ),
    );
  }

  Widget descriptContianer(String text) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      height: 90.h,
      width: double.infinity,
      margin: EdgeInsets.all(0.r),
      padding: EdgeInsets.all(20.r),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white, // Dynamic color
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 10),
            blurRadius: 10.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: MainColors
              .color1, // Or adjust text color based on container color
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  void _nextSlide() {
    setState(() {
      currentPageIndex++;
      if (currentPageIndex == appDescriptionList.length) {
        currentPageIndex = 0; // Reset to first slide
      }
    });
  }
}
