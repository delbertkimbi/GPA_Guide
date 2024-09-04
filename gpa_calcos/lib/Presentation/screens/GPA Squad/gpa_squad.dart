import 'package:flutter/material.dart';
import 'package:gpa_calcos/Presentation/Custom/files/Toast/showtoast.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/screens/GPA%20Squad/join_info_input.dart';
class GPASquad extends StatefulWidget {
  const GPASquad({super.key});

  @override
  State<GPASquad> createState() => _GPASquadState();
}

class _GPASquadState extends State<GPASquad> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.color4,
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
          "Study Squad",
          style: TextStyle(
              color: MainColors.color4,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/bob1.png', height: 300, width: 270,),
               Text('You don\'t belong to a study squad yet',style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('Create or join a squad to study and share resources with course mates.',
                 textAlign: TextAlign.start,
                 style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                ),),
              ),
              const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){

                showToast(message: 'Comning soon');
              },
                child: _actionButton(text: 'Create Squad', color: MainColors.color2)),
            GestureDetector(
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JoinSquadPage(),)),
                child: _actionButton(text: 'Join a Squad', color: MainColors.color1),),
            ],
          ),
        ),
      ),
    );
  }
  Widget _actionButton( {required String text,required Color color }){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical:5 ),
      padding:const  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child:Text(
        text,
        style:const  TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),),
    );
  }
}
