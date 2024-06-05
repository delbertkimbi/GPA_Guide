import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.title, required this.icon, this.trailling});
  final String title;
  final Widget icon;
  final Widget? trailling;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: MainColors.color1,
          fontSize: 15.sp,
        ),
      ),
      leading: icon,
      trailing: trailling,
    );
  }
}
