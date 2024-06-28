import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/list_tile.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';

import 'package:gpa_calcos/Presentation/screens/about.dart';
import 'package:gpa_calcos/Presentation/screens/auth/auth_services.dart';

import 'package:gpa_calcos/Presentation/screens/chat.dart';
import 'package:gpa_calcos/Presentation/screens/customized.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
  });
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: MainColors.color2,
            ),
            accountName: Text(
              'GPA Guide',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            accountEmail: Text(
              'Your semester study plug, with AI.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 5.h,
              backgroundColor: MainColors.color4,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0.r),
                      ),
                      child: Container(
                        height: 300.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          color: MainColors.color4,
                          borderRadius: BorderRadius.circular(10.r),
                          image: const DecorationImage(
                            image: AssetImage('assets/guide.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 34.h,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset('assets/try.png'),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: MainColors.color4,
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: CustomListTile(
                      title: "Home",
                      icon: Icon(
                        Icons.home,
                        color: MainColors.color2,
                        size: 30.r,
                      )),
                ),
                GestureDetector(
                  onTap: () => AutoRouter.of(context)
                      .push(const GpaCalculationsLanding()),
                  child: CustomListTile(
                      title: "GPA Calculations",
                      icon: Icon(
                        Icons.calculate,
                        color: MainColors.color2,
                        size: 30.r,
                      )),
                ),
                GestureDetector(
                  onTap: () => AutoRouter.of(context).push(const GpaGoals()),
                  child: CustomListTile(
                      title: "GPA Goals",
                      icon: Icon(
                        Icons.calculate_outlined,
                        color: MainColors.color2,
                        size: 30.r,
                      )),
                ),
                Divider(
                  height: 50.r,
                  color: Colors.black,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ChatAI())),
                  child: CustomListTile(
                    title: "Chat with Others/AI",
                    icon: Icon(
                      Icons.route,
                      color: MainColors.color2,
                      size: 30.r,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      AutoRouter.of(context).push(const Learningpage()),
                  child: CustomListTile(
                    title: "Study Resources",
                    icon: Icon(
                      Icons.search_rounded,
                      color: MainColors.color2,
                      size: 30.r,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CustomizedPage(),
                  )),
                  child: CustomListTile(
                    title: "Did you Know?",
                    icon: Icon(
                      Icons.help,
                      color: MainColors.color2,
                      size: 30.r,
                    ),
                  ),
                ),
                Divider(
                  height: 50.r,
                  color: Colors.black,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  )),
                  child: CustomListTile(
                    title: "About App",
                    icon: Icon(
                      Icons.adb_rounded,
                      color: MainColors.color2,
                      size: 30.r,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'SignOut',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: MainColors.color2,
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    IconButton(
                        onPressed: () async {
                          await _auth.signOut();
                          context.router.replace(const LogIn());
                        },
                        icon: Icon(
                          Icons.logout,
                          color: MainColors.color2,
                          size: 30.r,
                        )),
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
