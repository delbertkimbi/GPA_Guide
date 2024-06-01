import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class IndividaulGoals extends StatefulWidget {
  const IndividaulGoals({super.key});

  @override
  State<IndividaulGoals> createState() => _IndividaulGoalsState();
}

class _IndividaulGoalsState extends State<IndividaulGoals> {
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
          "Individaual Goals",
          style: TextStyle(
              color: MainColors.color4,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp),
        ),
      ),
    );
  }
}
