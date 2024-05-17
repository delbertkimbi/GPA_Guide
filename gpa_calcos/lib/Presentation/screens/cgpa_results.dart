import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class CgpaReultsPage extends StatefulWidget {
  final double cgpa;
  const CgpaReultsPage({
    super.key,
    required this.cgpa,
  });

  @override
  State<CgpaReultsPage> createState() => _CgpaReultsPageState();
}

class _CgpaReultsPageState extends State<CgpaReultsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: MainColors.color2,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              )),
          title: const Text(
            'CGPA Result',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        body: Center(
          child: Container(
            height: 300.h,
            width: 300.w,
            decoration: BoxDecoration(
              color: MainColors.color2,
              borderRadius: BorderRadius.circular(10.h),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your CGPA is',
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    color: Colors.white,
                  ),
                ),
                // SizedBox(height: 20.0.h),
                Text(
                  widget.cgpa.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 32.h,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _cgpaStatus()!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final TextStyle _textStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );
  Widget? _cgpaStatus() {
    if (widget.cgpa >= 2.0) {
      return Text(
        textAlign: TextAlign.center,
        "Congetulations!!! ",
        style: _textStyle,
      );
    } else if (widget.cgpa < 2.0 && widget.cgpa >= 0.0) {
      return Text(
        "Opps. You'll need to get a higher cgpa(>2.0) to graduate",
        style: _textStyle,
        textAlign: TextAlign.center,
      );
    }
    return null;
  }
}
