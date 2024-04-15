import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class Headers extends StatelessWidget {
  const Headers({super.key});

  @override
  Widget build(BuildContext context) {
    MainColors mainColors = MainColors();
    TextStyle tableText1 = TextStyle(
      color: Colors.white,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    );

    return SizedBox(
        child: Table(
            border: TableBorder.all(
              color: mainColors.color2,
            ),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
          TableRow(
            decoration: BoxDecoration(
              color: mainColors.color1,
              borderRadius: BorderRadius.circular(10.r),
            ),
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Text(
                    "Subject",
                    style: tableText1,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Text(
                    "Grade",
                    style: tableText1,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Text(
                    "Credit Value",
                    style: tableText1,
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
