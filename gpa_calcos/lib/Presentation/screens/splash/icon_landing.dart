import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';

@RoutePage()
class IconLandingPage extends StatefulWidget {
  const IconLandingPage({super.key});

  @override
  State<IconLandingPage> createState() => _IconLandingPageState();
}

class _IconLandingPageState extends State<IconLandingPage> {
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 4), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          context.router
              .replace(const HomePage()); // Navigate to HomePage if logged in
        } else {
          context.router.replace(const LogIn()); // Navigate to LogIn if logged out
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    // context.router.replace(const LogIn());

    //Cancel any timers before the widget is disposed of
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              height: 200.h,
              width: 200.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: const DecorationImage(
                  image: AssetImage('assets/GPA Calcos.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
    );
  }
}
