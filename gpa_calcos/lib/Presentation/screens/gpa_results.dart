import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

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
  

    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF949798),
              Color(0xFF5E8D9B),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        //decoration: mainGradient.gradient(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: MainColors.color2,
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                )),
            title: const Text(
              'GPA Result',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              color: MainColors.color3,
            ),
            child: Center(
              child: Container(
                height: 400.h,
                margin: EdgeInsets.symmetric(
                  vertical: 40.r,
                  horizontal: 30.r,
                ),
                decoration: BoxDecoration(
                  color: MainColors.color2,
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
                        fontSize: 20.sp,
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
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 9.r,
                    ),
                    Container(
                      height: 60.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MainColors.color1,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'GPA :${widget.gpa.toStringAsFixed(2)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
