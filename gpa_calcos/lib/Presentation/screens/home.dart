import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/Widgets/drawer.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/text.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';
import 'package:gpa_calcos/Presentation/screens/get_cgpa_info.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    CustomTextStyles custom = CustomTextStyles();
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3D7282),
              Color(0xFF0D191C),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          key: _scaffoldKey, // Assign GlobalKey
          drawer: const CustomDrawer(
            userName: 'Delbert Kimbi',
            userEmail: 'delbertdrums@gmail.com',
          ),
          appBar: AppBar(
            toolbarHeight: 80.h,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                size: 35.r,
              ),
              color: Colors.white,
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer(); // Use GlobalKey
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'GPA Calcos',
              style: custom.header1,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  'Let\'s help you calculate your',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(const GetSubjectInfo());
                  },
                  child: customBox(text: 'GPA  ', page: const GetSubjectInfo()),
                ),
                SizedBox(
                  height: 25.h,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const CgpaInfo();
                      },
                    ),
                  ),
                  child: customBox(text: 'CGPA', page: const CgpaInfo()),
                ),
                SizedBox(
                  height: 25.h,
                ),
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(const GradingSystem());
                  },
                  child: Container(
                    height: 62.h,
                    width: 298.h,
                    margin: EdgeInsets.symmetric(horizontal: 33.r),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xff5E808A),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      'Grading System',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.h,),
                Container(
                  height: 354.h,
                 // width: 400.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/home.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container customBox({required String text, required final page}) {
    return Container(
      height: 62.h,
      width: 298.h,
      margin: EdgeInsets.symmetric(horizontal: 33.r),
      //alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100.r,
          ),
          Text(
            text,
            style: TextStyle(
              color: MainColors.color2,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 55.r,
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 35.r,
              color: MainColors.color2,
            ),
            onPressed: () => AutoRouter.of(context).push(page),
          ),
        ],
      ),
    );
  }
}
