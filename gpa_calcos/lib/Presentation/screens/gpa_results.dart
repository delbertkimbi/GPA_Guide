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
      child: Container(
        decoration: mainGradient.gradient(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'Result',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: false,
            toolbarHeight: 50.h,
            elevation: 0.r,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(5.r),
            margin: EdgeInsets.symmetric(horizontal: 30.h, vertical: 0.h),
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 150,
              ),
              padding: EdgeInsets.fromLTRB(3.r, 4.r, 0.r, 9.r),
              decoration: BoxDecoration(
                color: mainColors.color2,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: (widget.gpa < 2.0)
                        ? Text(
                            "Don't be discouraged :) \n Just Study more ok!!!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: mainColors.color1,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            'Congratulations!!!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: mainColors.color1,
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
