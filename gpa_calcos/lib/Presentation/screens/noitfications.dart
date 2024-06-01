import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

@RoutePage()
class NotifactionsPage extends StatefulWidget {
  const NotifactionsPage({super.key});

  @override
  State<NotifactionsPage> createState() => _NotifactionsPageState();
}

class _NotifactionsPageState extends State<NotifactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: MainColors.color4,
            )),
        centerTitle: true,
        backgroundColor: MainColors.color2,
        elevation: 0,
        title: Text(
          "Notifications",
          style: TextStyle(
              color: MainColors.color4,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.notification_add_outlined,
                size: 40.sp,
                color: MainColors.color1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'No notifications available. Check back later.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MainColors.color1,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
