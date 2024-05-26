import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class StringSlider extends StatefulWidget {
  final List<String> strings;

  const StringSlider({super.key, required this.strings});

  @override
  State<StringSlider> createState() => _StringSliderState();
}

class _StringSliderState extends State<StringSlider> {
  int currentIndex = 0;
  final Map<String, Color> colorMap = {}; // Define your color mapping here

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (_) => changeString());
  }

  void changeString() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.strings.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) =>
            ScaleTransition(scale: animation, child: child),
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          height: 170.h,
          width: double.infinity,
          margin: EdgeInsets.all(0.r),
          padding: EdgeInsets.all(20.r),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: MainColors.color2,
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
            widget.strings[currentIndex],
            style: TextStyle(
              color:
                  Colors.white, // Or adjust text color based on container color
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
