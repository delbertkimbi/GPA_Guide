import 'package:auto_route/auto_route.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/Widgets/drawer.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/chat.dart';
import 'package:gpa_calcos/Presentation/screens/user_profile.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoggedIn = false; // Track user's sign-in state
  static String userImageUrl = " ";
  static String userName = "";
  static String userEmail = "";
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _isLoggedIn = user != null;
        if (user != null) {
          userImageUrl = user.photoURL?.toString() ?? "";
          userName = user.displayName ?? "";
          userEmail = user.email ?? "";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
          Colors.white,
            Colors.white,
            //Color(0xffF1EFFA),
            // Color(0xffF1EFFA),
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
        drawer: const CustomDrawer(),
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
          backgroundColor: MainColors.color5,
          actions: [
            IconButton(
              onPressed: () =>
                  AutoRouter.of(context).push(const NotifactionsPage()),
              icon: Icon(
                Icons.notification_add,
                color: MainColors.color1,
              ),
            ),
            _isLoggedIn
                ? GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return UserProfile(
                          userImageUrl: userImageUrl,
                          userName: userName,
                          userEmail: userEmail,
                        );
                      }));
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 14.r,
                      backgroundImage: _isLoggedIn
                          ? NetworkImage(
                              userImageUrl) // Use NetworkImage for profile picture
                          : null,
                      child: userImageUrl.isEmpty == true
                          ? Icon(
                              Icons.person,
                              size: 20.r,
                            )
                          : null, // Show progress indicator while fetching
                    ),
                  )
                : GestureDetector(
                    onTap: () => AutoRouter.of(context).push(const LogIn()),
                    child: Container(
                      width: 55.r,
                      height: 27.r,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                          color: MainColors.color1,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Text(
                        'LogIn',
                        style: TextStyle(
                          color: MainColors.color4,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              width: 15.h,
            ),
          ],
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 27.r,
            ),
            color: MainColors.color1,
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer(); // Use GlobalKey
            },
          ),
          elevation: 5,
          centerTitle: true,
          title: Text(
            'GPA Guide',
            style: TextStyle(
              color: MainColors.color1,
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 20.h,
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
                          iconColor: Colors.purple,
                          textColor: MainColors.color1,
                          color: MainColors.color4,
                          icon: Icons.drive_file_rename_outline_rounded,
                          text: 'GPA Goals',
                          page: const GpaGoals(),
                        ),
                        SizedBox(
                          width: 30.h,
                        ),
                        customBox(
                          iconColor: Colors.green,
                          textColor: MainColors.color1,
                          color: MainColors.color4,
                          icon: Icons.menu_book_sharp,
                          text: 'Study plan',
                          page: const StudyPlanLandingPage(),
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
                          iconColor: Colors.red,
                          textColor: MainColors.color1,
                          color: MainColors.color4,
                          icon: Icons.calculate_rounded,
                          text: 'GPA Calcos',
                          page: const GpaCalculationsLanding(),
                        ),
                        SizedBox(
                          width: 30.h,
                        ),
                        customBox(
                          iconColor: Colors.blueAccent,
                          textColor: MainColors.color1,
                          color: MainColors.color4,
                          icon: Icons.grade_rounded,
                          text: 'Re-Sources',
                          page: const Learningpage(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width/18
                        // ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/22),
                          child: customBox(
                            iconColor: MainColors.color2,
                            textColor: MainColors.color1,
                            color: MainColors.color2,
                            icon: Icons.book_rounded,
                            text: 'Grade System',
                            page: const GradingSystem(),
                          ),
                        ),
                      ],
                    ),
                  ],
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
      required Color color,
      required Color iconColor,
      required Color textColor}) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(page);
      },
      child: Container(
        height: 130.h,
        width: 130.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          //color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15.r),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.9),
              blurRadius: 1.0.r,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: iconColor.withOpacity(0.2),
              child: Icon(
                icon,
                size: 27.r,
                color: iconColor,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                //color: Colors.white, Resources, Materials
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
