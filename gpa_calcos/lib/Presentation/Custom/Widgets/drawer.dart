import 'package:flutter/material.dart';
import 'package:gpa_calcos/Presentation/Custom/files/list_tile.dart';

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
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
            ),
            accountName: Text(userName),
            accountEmail: Text(userEmail),
            currentAccountPicture: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.black45,
              child: ClipOval(
                child: Text(
                  userName[0],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
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
                  title: "Post a bug",
                  icon: Icon(
                    Icons.add,
                    color: Colors.black45,
                    size: 30,
                  )),
              const CustomListTile(
                  title: "Solve bugs",
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
                title: "Chat AI",
                icon: Icon(
                  Icons.add,
                  color: Colors.black45,
                  size: 30,
                ),
              ),
              const CustomListTile(
                title: "Learn C programming",
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
              const CustomListTile(
                title: "LogOut",
                icon: Icon(
                  Icons.add,
                  color: Colors.black45,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
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
