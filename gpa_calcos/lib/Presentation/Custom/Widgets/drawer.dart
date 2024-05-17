import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/list_tile.dart';
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
            accountName: Text(userName),
            accountEmail: Text(userEmail),
            currentAccountPicture: CircleAvatar(
              radius: 10,
              backgroundColor: MainColors.color1,
              child: ClipOval(
                child: Text(
                  userName[0],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.r,
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
                    Icons.help,
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
                    Icons.branding_watermark,
                    color: MainColors.color1,
                    size: 30.r,
                  ),
                ),
              ),
              Divider(
                height: 50.r,
                color: Colors.black,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "LogOut",
                    style: TextStyle(
                      color: MainColors.color1,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.r,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.logout,
                      color: MainColors.color1,
                      size: 50,
                    ),
                  )
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
