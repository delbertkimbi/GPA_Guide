import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';

@RoutePage()
class GradingSystem extends StatefulWidget {
  const GradingSystem({super.key});

  @override
  State<GradingSystem> createState() => _GradingSystemState();
}

class _GradingSystemState extends State<GradingSystem> {
  TextStyle tableText1 = TextStyle(
    color: Colors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  TextStyle tableText2 = TextStyle(
    color: Colors.black,
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
  );
  List<String> grades = ["A", "B+", "B", "C+", "C", "D+", "D", "F"];
  List<String> scoreRange = [
    "80-100",
    "70-79",
    "60-69",
    "55-59",
    "50-54",
    "45-49",
    "40-44",
    "0-39"
  ];
  List<double> gradePoints = [4, 3.5, 3, 2.5, 2, 1.5, 1, 0];

  @override
  Widget build(BuildContext context) {
    MainColors mainColors = MainColors();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const HomePage());
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          backgroundColor: mainColors.color2,
          title: Text(
            'Grading System',
            textAlign: TextAlign.center,
            style: tableText1,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.r, 30.r, 20.r, 20.r),
                child: Table(
                  border: TableBorder.all(
                    color: mainColors.color2,
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: mainColors.color2,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Text("Score/100", style: tableText1),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Text(
                              "Grade",
                              textAlign: TextAlign.center,
                              style: tableText1,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Text(
                              "Grade point/4",
                              textAlign: TextAlign.center,
                              style: tableText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ...List.generate(8, (index) {
                      return TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: Text(
                                scoreRange[index],
                                style: tableText2,
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                grades[index],
                                style: tableText2,
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: Text(
                                "${gradePoints[index]}",
                                style: tableText2,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.r, 3.r, 20.r, 0.r),
                child: RichText(
                  text: TextSpan(
                    text: "NB",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: mainColors.color1,
                    ),
                    children: [
                      const TextSpan(
                        text: "\n",
                      ),
                      TextSpan(
                        text:
                            "The grade system is based on  University of Buea(Cameroon) approach to grading students.\n",
                        style: tableText2,
                      ),
                      TextSpan(
                        text:
                            "If it does not suit your school, you can always edit by clicking on the button below.\n\n",
                        style: tableText2,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 30.w),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: mainColors.color2,
                  ),
                  child: Text(
                    "Customize contents",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
