import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

// ignore: must_be_immutable
class UserProfile extends StatefulWidget {
  UserProfile(
      {super.key,
      required this.userEmail,
      required this.userName,
      required this.userImageUrl});

  String? userImageUrl;
  String? userName;
  String? userEmail;
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.color5,
      appBar: AppBar(
        backgroundColor: MainColors.color5,
        elevation: 3,
        centerTitle: true,
        title: Text(
          'My Profile',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: MainColors.color1),
        ),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: MainColors.color1,
            )),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 300.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 25.r),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MainColors.color5,
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
                  radius: 75.r,
                  backgroundImage: NetworkImage(widget.userImageUrl!),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  widget.userName!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: MainColors.color1,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  widget.userEmail?.toString() ?? " email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: MainColors.color1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          // Container(
          //   height: 250.h, // Adjust height as needed
          //   width: double.infinity,
          //   margin: EdgeInsets.symmetric(horizontal: 25.r),
          //   decoration: BoxDecoration(
          //     color: MainColors.color2, // Assuming blue color from MainColors
          //     borderRadius: BorderRadius.circular(15.r),
          //   ),
          //   child: ListView.separated( // Use ListView.separated for dividers
          //     padding: EdgeInsets.zero,
          //     itemCount: 4, // Number of items in the list
          //     separatorBuilder: (context, index) => Divider(
          //       color: Colors.grey[300],
          //       thickness: 1.0,
          //     ), // Add divider between items
          //     itemBuilder: (context, index) {
          //       String itemText;
          //       final Function()? callback;
          //       IconData itemIcon;
          //       switch (index) {
          //         case 0:
          //           itemText = "Notifications";
          //           itemIcon = Icons.notifications;
          //           callback=(){
          //             setState(() {
          //              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NotifactionsPage()));
          //             });
          //           };
          //           break;
          //         case 1:
          //           itemText = "Change Language";
          //           itemIcon = Icons.language;
          //           break;
          //         case 2:
          //           itemText = "Switch Mode";
          //           itemIcon = Icons.toggle_off_outlined;
          //           break;
          //         case 3:
          //           itemText = "Logout";
          //           itemIcon = Icons.logout;
          //           break;
          //         default:
          //           itemText = " ";
          //           itemIcon = Icons.error;
          //           break;
          //       }
          //       return ListTile(
          //         leading: Icon(itemIcon,size: 30, color:MainColors.color1,),
          //         title: Text(itemText, style: TextStyle(color: MainColors.color5,fontSize: 16.sp, fontWeight: FontWeight.w500),),
          //
          //         onTap: () {
          //           // Handle item tap here
          //         },
          //       );
          //     },
          //   ),
          // ),

        ],
      ),
    );
  }
}
