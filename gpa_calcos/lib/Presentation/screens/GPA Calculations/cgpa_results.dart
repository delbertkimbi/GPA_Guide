import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

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
        body: Column(
          children: [
            Screenshot(
              controller: _screenshotController,
              child: Container(
                height: 300.h,
                width: 300.w,
                margin: EdgeInsets.symmetric(
                  vertical: 40.r,
                  horizontal: 30.r,
                ),
                decoration: BoxDecoration(
                    color: MainColors.color2,
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        // color: Colors.black.withOpacity(0.3.r),
                        color: const Color(0xff9191F5),
                        offset: const Offset(4.0, 4.0),
                        blurRadius: 25.0.r,
                        spreadRadius: 1.0.r,
                      ),
                      BoxShadow(
                        // color: Colors.black.withOpacity(0.3.r),
                        color: MainColors.color4,
                        offset: const Offset(-4.0, -4.0),
                        blurRadius: 5.0.r,
                        spreadRadius: 1.0.r,
                      ),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Your Results',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: MainColors.color1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "CGPA: ${widget.cgpa.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 25.h,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: _cgpaStatus()!,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.r, 0, 10.r, 0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _takeScreenShot,
                      child: shareSave(text: 'Share', icon: Icons.share),
                    ),
                    SizedBox(
                      width: 20.r,
                    ),
                    shareSave(text: 'Save', icon: Icons.save),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final TextStyle _textStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
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
        "Opps. You'll need to get a higher cgpa(>=2.0)",
        style: _textStyle,
        textAlign: TextAlign.center,
      );
    }
    return null;
  }

  Container shareSave({required String text, required IconData icon}) {
    return Container(
      width: 120.w,
      height: 50.h,
      alignment: Alignment.center,
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
          color: MainColors.color1,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              // color: Colors.black.withOpacity(0.3.r),
              color: Colors.grey.shade500,
              offset: const Offset(4.0, 4.0),
              blurRadius: 25.0.r,
              spreadRadius: 1.0.r,
            ),
            BoxShadow(
              // color: Colors.black.withOpacity(0.3.r),
              color: MainColors.color4,
              offset: const Offset(-4.0, -4.0),
              blurRadius: 5.0.r,
              spreadRadius: 1.0.r,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: MainColors.color4,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            width: 10.r,
          ),
          Icon(
            icon,
            color: Colors.yellow,
            size: 20.r,
          )
        ],
      ),
    );
  }

  final ScreenshotController _screenshotController = ScreenshotController();
  void _takeScreenShot() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Capturing screenshot...'),
        duration: Duration(milliseconds: 200), // Adjust duration as needed
      ),
    );

    await Future.delayed(const Duration(milliseconds: 200)); // Wait for 200ms
    dynamic image;
    final imageFile = await _screenshotController.capture();
    setState(() {
      image = imageFile;
    });
    Share.shareXFiles([XFile(image.toString())],
        text: 'My GPA calculated by GPA Calcos');
  }
}
