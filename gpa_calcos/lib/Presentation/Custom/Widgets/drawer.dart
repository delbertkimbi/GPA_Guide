import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/list_tile.dart';
import 'package:gpa_calcos/Presentation/screens/about.dart';
import 'package:gpa_calcos/Presentation/screens/chat.dart';
import 'package:gpa_calcos/Presentation/screens/customized.dart';
import 'package:gpa_calcos/Presentation/screens/get_cgpa_info.dart';
import 'package:gpa_calcos/Presentation/screens/get_gpa_info.dart';
import 'package:gpa_calcos/Presentation/screens/learning_resources.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;

  const CustomDrawer({
    super.key,
    required this.userName,
    required this.userEmail,
  });

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
              userName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            accountEmail: Text(
              userEmail,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 5.h,
              backgroundColor: Colors.white,
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
                          borderRadius: BorderRadius.circular(10.r),
                          image: const DecorationImage(
                            image: AssetImage('assets/GPA Calcos.png'),
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
                    child: Image.asset('assets/bg1.png'),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: CustomListTile(
                    title: "Home",
                    icon: Icon(
                      Icons.home,
                      color: MainColors.color1,
                      size: 30.r,
                    )),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const GetSubjectInfo())),
                child: CustomListTile(
                    title: "Calculate Gpa",
                    icon: Icon(
                      Icons.calculate,
                      color: MainColors.color1,
                      size: 30.r,
                    )),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CgpaInfo())),
                child: CustomListTile(
                    title: "Calculate Cgpa",
                    icon: Icon(
                      Icons.calculate_outlined,
                      color: MainColors.color1,
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
                  title: "Get Help(AI)",
                  icon: Icon(
                    Icons.route,
                    color: MainColors.color1,
                    size: 30.r,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Learningpage(),
                )),
                child: CustomListTile(
                  title: "Learning Resources \n(Get better grades)",
                  icon: Icon(
                    Icons.search_rounded,
                    color: MainColors.color1,
                    size: 30.h,
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
                    color: MainColors.color1,
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
                  builder: (context) => AboutPage(),
                )),
                child: CustomListTile(
                  title: "About App",
                  icon: Icon(
                    Icons.adb_rounded,
                    color: MainColors.color1,
                    size: 30.r,
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
