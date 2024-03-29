import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/list_tile.dart';
import 'package:gpa_calcos/Presentation/screens/home.dart';

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
    MainColors mainColors = MainColors();
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: mainColors.color2,
            ),
            accountName: Text(userName),
            accountEmail: Text(userEmail),
            currentAccountPicture: CircleAvatar(
              radius: 10,
              backgroundColor: mainColors.color1,
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
              const CustomListTile(
                  title: "Home",
                  icon: Icon(
                    Icons.add,
                    color: Colors.black45,
                    size: 30,
                  )),
              const CustomListTile(
                  title: "Calculate Gpa",
                  icon: Icon(
                    Icons.add,
                    color: Colors.black45,
                    size: 30,
                  )),
              const CustomListTile(
                  title: "Calculate Cgpa",
                  icon: Icon(
                    Icons.add,
                    color: Colors.black45,
                    size: 30,
                  )),
              const Divider(
                height: 50,
                color: Colors.black,
              ),
              const CustomListTile(
                title: "Get Help",
                icon: Icon(
                  Icons.add,
                  color: Colors.black45,
                  size: 30,
                ),
              ),
              const CustomListTile(
                title: "Learning Resources",
                icon: Icon(
                  Icons.add,
                  color: Colors.black45,
                  size: 30,
                ),
              ),
              const Divider(
                height: 20,
              ),
              const CustomListTile(
                title: "Settings",
                icon: Icon(
                  Icons.add,
                  color: Colors.black45,
                  size: 30,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "LogOut",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.black45,
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
