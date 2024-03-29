import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/gradient.dart';

@RoutePage()
class ResultPage extends StatefulWidget {
  final double cwgp;
  final double ccv;
  final double gpa;
  const ResultPage({
    super.key,
    required this.ccv,
    required this.cwgp,
    required this.gpa,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    MainGradient mainGradient = MainGradient();
    MainColors mainColors = MainColors();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: mainGradient.gradient(),
          child: Center(
            child: Container(
              height: 400.h,
              margin: EdgeInsets.symmetric(
                vertical: 40.r,
                horizontal: 30.r,
              ),
              decoration: BoxDecoration(
                color: mainColors.color2,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Results!!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.r,
                  ),
                  Text(
                    'CWGP: ${widget.cwgp.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 9.r,
                  ),
                  Text(
                    'CCV: ${widget.ccv.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 9.r,
                  ),
                  Text(
                    'GPA :${widget.gpa.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
