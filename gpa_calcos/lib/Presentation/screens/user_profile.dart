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
        ],
      ),
    );
  }
}
